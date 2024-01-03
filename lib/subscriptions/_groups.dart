import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker_plus/IconPicker/Packs/Material.dart';
import 'package:flutter_iconpicker_plus/flutter_iconpicker.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/group/group_screen.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:squawker/user.dart';
import 'package:squawker/utils/ui_util.dart';
import 'package:provider/provider.dart';

Future openSubscriptionGroupDialog(BuildContext context, String? id, String name, String icon) {
  return showDialog(
      context: context,
      builder: (context) {
        return SubscriptionGroupEditDialog(id: id, name: name, icon: icon);
      });
}

class SubscriptionGroups extends StatefulWidget {
  final ScrollController scrollController;

  const SubscriptionGroups({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<SubscriptionGroups> createState() => _SubscriptionGroupsState();
}

class _SubscriptionGroupsState extends State<SubscriptionGroups> {
  Widget _createGroupCard(
      String id, String name, String icon, Color? color, int? numberOfMembers, void Function()? onLongPress) {
    var title = numberOfMembers == null ? name : '$name ($numberOfMembers)';

    return Card(
      child: InkWell(
        onTap: () {
          // Open page with the group's feed
          Navigator.pushNamed(context, routeGroup, arguments: GroupScreenArguments(id: id, name: name));
        },
        onLongPress: onLongPress,
        child: Column(
          children: [
            Container(
              color: color != null ? color.withOpacity(0.9) : Theme.of(context).highlightColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Icon(deserializeIconData(icon), size: 24),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              color: color != null ? color.withOpacity(0.4) : Colors.white10,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Text(title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<GroupsModel, List<SubscriptionGroup>>.transition(
      store: context.read<GroupsModel>(),
      // TODO: Error
      onState: (_, state) {
        return GridView.builder(
          controller: widget.scrollController,
          padding: const EdgeInsets.only(top: 4),
          gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 180, childAspectRatio: 200 / 150),
          itemCount: state.length + 2,
          itemBuilder: (context, index) {
            var actualIndex = index - 1;
            if (actualIndex == -1) {
              return _createGroupCard('-1', L10n.of(context).all, defaultGroupIcon, null, null, null);
            }

            if (actualIndex < state.length) {
              var e = state[actualIndex];

              return _createGroupCard(e.id, e.name, e.icon, e.color, e.numberOfMembers,
                  () => openSubscriptionGroupDialog(context, e.id, e.name, e.icon));
            }

            return Card(
              child: InkWell(
                onTap: () {
                  openSubscriptionGroupDialog(context, null, '', defaultGroupIcon);
                },
                child: DottedBorder(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_rounded, size: 16),
                        const SizedBox(height: 4),
                        Text(
                          L10n.of(context).newTrans,
                          style: const TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SubscriptionGroupEditDialog extends StatefulWidget {
  final String? id;
  final String name;
  final String icon;

  const SubscriptionGroupEditDialog({Key? key, required this.id, required this.name, required this.icon})
      : super(key: key);

  @override
  State<SubscriptionGroupEditDialog> createState() => _SubscriptionGroupEditDialogState();
}

class _SubscriptionGroupEditDialogState extends State<SubscriptionGroupEditDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  SubscriptionGroupEdit? _group;

  late String? id;
  late String? name;
  late String icon;
  Color? color;
  Set<String> members = <String>{};
  double breakpointScreenWidth1 = 200;
  double breakpointScreenWidth2 = 400;
  double breakpointTextWidth = 280;

  @override
  void initState() {
    super.initState();

    setState(() {
      icon = widget.icon;
    });

    context.read<GroupsModel>().loadGroupEdit(widget.id).then((group) => setState(() {
          _group = group;

          id = group.id;
          name = group.name;
          icon = group.icon;
          color = group.color;
          members = group.members;
        }));
  }

  void openDeleteSubscriptionGroupDialog(String id, String name) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(L10n.of(context).no),
              ),
              TextButton(
                onPressed: () async {
                  await context.read<GroupsModel>().deleteGroup(id);

                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(L10n.of(context).yes),
              ),
            ],
            title: Text(L10n.of(context).are_you_sure),
            content: Text(
              L10n.of(context).are_you_sure_you_want_to_delete_the_subscription_group_name_of_group(name),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var subscriptionsModel = context.read<SubscriptionsModel>();

    var group = _group;
    if (group == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Filter the Material icons to only the ones the app uses
    var iconPack = icons.entries.where((value) => value.key.endsWith('_rounded') || value.key.endsWith('_rounded'));

    List<Widget> buttonsLst1 = [
      TextButton(
        onPressed: () {
          setState(() {
            if (members.isEmpty) {
              members = subscriptionsModel.state.map((e) => e.id).toSet();
            } else {
              members.clear();
            }
          });
        },
        child: Text(L10n.of(context).toggle_all),
      ),
      TextButton(
        onPressed: id == null ? null : () => openDeleteSubscriptionGroupDialog(id!, name!),
        child: Text(L10n.of(context).delete),
      ),
    ];
    List<Widget> buttonsLst2 = [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(L10n.of(context).cancel),
      ),
      Builder(builder: (context) {
        onPressed() async {
          if (_formKey.currentState!.validate()) {
            await context.read<GroupsModel>().saveGroup(id, name!, icon, color, members);

            Navigator.pop(context);
          }
        }

        return TextButton(
          onPressed: onPressed,
          child: Text(L10n.of(context).ok),
        );
      }),
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double allTextsWidth = calcTextSize(context,
            '   ${L10n.of(context).toggle_all}   ${L10n.of(context).delete}   ${L10n.of(context).cancel}  ${L10n.of(context).ok}   ')
        .width;
    double halfTextsWidth1 =
        calcTextSize(context, '   ${L10n.of(context).toggle_all}   ${L10n.of(context).delete}   ').width;
    double halfTextsWidth2 = calcTextSize(context, '   ${L10n.of(context).cancel}   ${L10n.of(context).ok}   ').width;
    double halfTextsWidth = halfTextsWidth1 > halfTextsWidth2 ? halfTextsWidth1 : halfTextsWidth2;
    if (kDebugMode) {
      print(
          '*** _SubscriptionGroupEditDialogState - screenWidth = $screenWidth, allTextsWidth = $allTextsWidth, halfTextsWidth = $halfTextsWidth');
    }

    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: screenWidth >= breakpointScreenWidth2 && allTextsWidth < breakpointTextWidth
              ? 20
              : screenWidth >= breakpointScreenWidth1 && halfTextsWidth < breakpointTextWidth
                  ? 10
                  : 5),
      actions: [
        SizedBox(
            width: screenWidth,
            child: screenWidth >= breakpointScreenWidth2 && allTextsWidth < breakpointTextWidth
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ...buttonsLst1,
                    ...buttonsLst2,
                  ])
                : screenWidth >= breakpointScreenWidth1 && halfTextsWidth < breakpointTextWidth
                    ? Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          ...buttonsLst1,
                        ]),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          ...buttonsLst2,
                        ]),
                      ])
                    : Column(mainAxisSize: MainAxisSize.min, children: [
                        ...buttonsLst1,
                        ...buttonsLst2,
                      ])),
      ],
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: group.name,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText: L10n.of(context).name,
                      ),
                      onChanged: (value) => setState(() {
                        name = value;
                      }),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return L10n.of(context).please_enter_a_name;
                        }

                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.palette_rounded, color: color),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            var selectedColor = color;

                            return AlertDialog(
                              title: Text(L10n.of(context).pick_a_color),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: color ?? Colors.grey,
                                  onColorChanged: (value) => setState(() {
                                    selectedColor = value;
                                  }),
                                  enableLabel: true,
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(L10n.of(context).cancel),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(L10n.of(context).ok),
                                  onPressed: () {
                                    setState(() {
                                      color = selectedColor;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  IconButton(
                    icon: Icon(deserializeIconData(icon)),
                    onPressed: () async {
                      var selectedIcon = await FlutterIconPicker.showIconPicker(context,
                          iconPackModes: [IconPack.custom],
                          customIconPack: Map.fromEntries(iconPack),
                          title: Text(L10n.of(context).pick_an_icon),
                          closeChild: Text(L10n.of(context).close),
                          searchHintText: L10n.of(context).search,
                          noResultsText: L10n.of(context).no_results_for);
                      if (selectedIcon != null) {
                        setState(() {
                          icon = jsonEncode(serializeIcon(selectedIcon));
                        });
                      }
                    },
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: subscriptionsModel.state.length,
                  itemBuilder: (context, index) {
                    var subscription = subscriptionsModel.state[index];

                    var subtitle =
                        subscription is SearchSubscription ? L10n.current.search_term : '@${subscription.screenName}';

                    var icon = subscription is SearchSubscription
                        ? const SizedBox(width: 48, child: Icon(Icons.search_rounded))
                        : UserAvatar(uri: subscription.profileImageUrlHttps);

                    return CheckboxListTile(
                      dense: true,
                      secondary: icon,
                      title: Text(subscription.name),
                      subtitle: Text(subtitle),
                      selected: members.contains(subscription.id),
                      value: members.contains(subscription.id),
                      onChanged: (v) => setState(() {
                        if (v == null || v == false) {
                          members.remove(subscription.id);
                        } else {
                          members.add(subscription.id);
                        }
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
