import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/search/search.dart';
import 'package:squawker/subscriptions/_groups.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/utils/data_service.dart';
import 'package:squawker/utils/misc.dart';
import 'package:squawker/utils/route_util.dart';
import 'package:squawker/user.dart';

class SubscriptionUsers extends StatefulWidget {
  const SubscriptionUsers({Key? key}) : super(key: key);

  @override
  State<SubscriptionUsers> createState() => _SubscriptionUsersState();
}

class _SubscriptionUsersState extends State<SubscriptionUsers> {
  final GlobalKey<SubscriptionUsersListState> _key = GlobalKey<SubscriptionUsersListState>();

  @override
  Widget build(BuildContext context) {
    var model = context.read<SubscriptionsModel>();

    return ScopedBuilder<SubscriptionsModel, List<Subscription>>.transition(
      store: model,
      onLoading: (_) => const Center(child: CircularProgressIndicator()),
      onError: (_, e) =>
          FullPageErrorWidget(error: e, stackTrace: null, prefix: L10n.of(context).unable_to_refresh_the_subscriptions),
      onState: (_, state) {
        if (state.isEmpty) {
          return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text('¯\\_(ツ)_/¯', style: TextStyle(fontSize: 32)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(L10n.of(context).no_subscriptions_try_searching_or_importing_some,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                        child: Text(L10n.of(context).import_from_twitter),
                        onPressed: () => Navigator.pushNamed(context, routeSubscriptionsImport),
                      ),
                    )
                  ]));
        }

        return SubscriptionUsersList(key: _key, subscriptions: state);
      },
    );
  }
}

class SubscriptionUsersList extends StatefulWidget {
  final List<Subscription> subscriptions;

  const SubscriptionUsersList({super.key, required this.subscriptions});

  @override
  State<SubscriptionUsersList> createState() => SubscriptionUsersListState();
}

class SubscriptionUsersListState extends State<SubscriptionUsersList> {
  final List<Subscription> subLst = [];
  bool _isMultiSelectMode = false;
  final Set<String> _selectedIds = {};

  @override
  Widget build(BuildContext context) {
    BasePrefService prefs = PrefService.of(context);
    String subscriptionOrderCustom = prefs.get(optionSubscriptionOrderCustom);
    subLst.clear();
    if (subscriptionOrderCustom.isNotEmpty) {
      subLst.addAll(subscriptionOrderCustom.split(',').map((sn) => widget.subscriptions.firstWhere((s) => s.screenName == sn)));
    } else {
      subLst.addAll(widget.subscriptions);
    }

    return Scaffold(
      appBar: _isMultiSelectMode ? _buildMultiSelectAppBar(context) : null,
      body: _buildBody(context, prefs),
      bottomNavigationBar: _isMultiSelectMode ? _buildMultiSelectBottomBar(context) : null,
    );
  }

  PreferredSizeWidget _buildMultiSelectAppBar(BuildContext context) {
    final l10n = L10n.of(context);
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: _exitMultiSelectMode,
      ),
      title: Text(l10n.selected_count(_selectedIds.length)),
      actions: [
        IconButton(
          icon: const Icon(Icons.select_all),
          tooltip: l10n.select_all,
          onPressed: _selectAll,
        ),
        IconButton(
          icon: const Icon(Icons.deselect),
          tooltip: l10n.deselect_all,
          onPressed: _deselectAll,
        ),
        IconButton(
          icon: const Icon(Icons.flip),
          tooltip: l10n.invert_selection,
          onPressed: _invertSelection,
        ),
      ],
    );
  }

  Widget _buildMultiSelectBottomBar(BuildContext context) {
    final l10n = L10n.of(context);
    final model = context.read<SubscriptionsModel>();
    final groupModel = context.read<GroupsModel>();

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Symbols.person_remove_rounded, color: Colors.red),
            tooltip: l10n.batch_unsubscribe,
            onPressed: () => _batchUnsubscribe(context, model),
          ),
          IconButton(
            icon: const Icon(Symbols.group_add_rounded),
            tooltip: l10n.batch_add_to_group,
            onPressed: () => _batchAddToGroup(context, groupModel),
          ),
          IconButton(
            icon: const Icon(Symbols.person_remove_rounded),
            tooltip: l10n.batch_remove_from_feed,
            onPressed: () => _batchRemoveFromFeed(context, model),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, BasePrefService prefs) {
    if (_isMultiSelectMode) {
      return _buildMultiSelectList(context);
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: subLst.length,
      itemBuilder: (context, i) {
        var user = subLst[i];
        if (user is UserSubscription) {
          return UserTile(
            key: Key(user.screenName),
            user: user,
            onLongPress: () => _enterMultiSelectMode(user.id),
          );
        }

        return ListTile(
          key: Key(user.screenName),
          dense: true,
          leading: const SizedBox(width: 48, child: Icon(Symbols.search_rounded)),
          title: Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Text(L10n.current.search_term),
          trailing: SizedBox(
            width: 36,
            child: FollowButton(user: user),
          ),
          onTap: () {
            pushNamedRoute(context, routeSearch, SearchArguments(1, focusInputOnOpen: false, query: user.id));
          },
        );
      },
      onReorder: (oldIndex, newIndex) async {
        if (oldIndex < newIndex) {
          Subscription s = subLst.removeAt(oldIndex);
          subLst.insert(newIndex - 1, s);
        } else {
          Subscription s = subLst.removeAt(oldIndex);
          subLst.insert(newIndex, s);
        }
        await prefs.set(optionSubscriptionOrderCustom, subLst.map((s) => s.screenName).join(','));
      },
    );
  }

  Widget _buildMultiSelectList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: subLst.length,
      itemBuilder: (context, i) {
        var user = subLst[i];
        var isSelected = _selectedIds.contains(user.id);

        return ListTile(
          key: Key(user.screenName),
          dense: true,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (value) => _toggleSelection(user.id),
              ),
              if (user is UserSubscription)
                UserAvatar(uri: user.profileImageUrlHttps)
              else
                const SizedBox(width: 48, child: Icon(Symbols.search_rounded)),
            ],
          ),
          title: Row(
            children: [
              Flexible(child: Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (user is UserSubscription && user.verified) const SizedBox(width: 6),
              if (user is UserSubscription && user.verified) Icon(Symbols.verified, size: 14, color: Theme.of(context).primaryColor)
            ],
          ),
          subtitle: Text('@${user.screenName}', maxLines: 1, overflow: TextOverflow.ellipsis),
          onTap: () => _toggleSelection(user.id),
        );
      },
    );
  }

  void _enterMultiSelectMode(String initialId) {
    setState(() {
      _isMultiSelectMode = true;
      _selectedIds.clear();
      _selectedIds.add(initialId);
    });
  }

  void _exitMultiSelectMode() {
    setState(() {
      _isMultiSelectMode = false;
      _selectedIds.clear();
    });
  }

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (_selectedIds.isEmpty) {
          _isMultiSelectMode = false;
        }
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _selectAll() {
    setState(() {
      _selectedIds.clear();
      _selectedIds.addAll(subLst.map((s) => s.id));
    });
  }

  void _deselectAll() {
    setState(() {
      _selectedIds.clear();
    });
  }

  void _invertSelection() {
    setState(() {
      final allIds = subLst.map((s) => s.id).toSet();
      final newSelection = allIds.difference(_selectedIds);
      _selectedIds.clear();
      _selectedIds.addAll(newSelection);
    });
  }

  List<Subscription> _getSelectedSubscriptions() {
    return subLst.where((s) => _selectedIds.contains(s.id)).toList();
  }

  Future<void> _batchUnsubscribe(BuildContext context, SubscriptionsModel model) async {
    final l10n = L10n.of(context);
    final selected = _getSelectedSubscriptions();

    if (selected.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.batch_unsubscribe),
        content: Text(l10n.batch_unsubscribe_confirm(selected.length)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(l10n.unsubscribe),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      for (var user in selected) {
        var followed = true; // We're unsubscribing, so they must be followed
        await model.toggleSubscribe(user, followed);
      }
      _exitMultiSelectMode();
    }
  }

  Future<void> _batchAddToGroup(BuildContext context, GroupsModel groupModel) async {
    final l10n = L10n.of(context);
    final selected = _getSelectedSubscriptions();

    if (selected.isEmpty) return;

    final selectedIds = selected.map((s) => s.id).toSet();

    dynamic resp = 'reload';
    while (resp is String && resp == 'reload') {
      resp = await showDialog(
        context: context,
        builder: (_) => MultiSelectDialog(
          title: Row(
            children: [
              Text(l10n.select_groups),
              const Spacer(),
              IconButton(
                icon: const Icon(Symbols.add),
                onPressed: () async {
                  await openSubscriptionGroupDialog(context, null, '', defaultGroupIcon, preMembers: selectedIds);
                  Navigator.pop(context, 'reload');
                },
              ),
            ],
          ),
          searchHint: l10n.search,
          confirmText: Text(l10n.ok),
          cancelText: Text(l10n.cancel),
          itemsTextStyle: Theme.of(context).textTheme.bodyLarge,
          selectedColor: Theme.of(context).colorScheme.secondary,
          items: groupModel.state.map((e) => MultiSelectItem(e.id, e.name)).toList(),
          initialValue: [],
          onConfirm: (List<dynamic> memberships) async {
            for (var id in selectedIds) {
              await groupModel.saveUserGroupMembership(id, memberships.cast<String>());
            }
          },
        ),
      );
    }

    _exitMultiSelectMode();
  }

  Future<void> _batchRemoveFromFeed(BuildContext context, SubscriptionsModel model) async {
    final l10n = L10n.of(context);
    final selected = _getSelectedSubscriptions().whereType<UserSubscription>().where((u) => u.inFeed).toList();

    if (selected.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.batch_remove_from_feed),
        content: Text(l10n.batch_remove_from_feed_confirm(selected.length)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      for (var user in selected) {
        await model.toggleFeed(user, true);
      }
      _exitMultiSelectMode();
    }
  }
}
