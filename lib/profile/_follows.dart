import 'package:flutter/material.dart';

import 'package:squawker/client/client.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/ui/cursor_paging.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/user.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:squawker/generated/l10n.dart';

class ProfileFollows extends StatefulWidget {
  final UserWithExtra user;
  final String type;

  const ProfileFollows({Key? key, required this.user, required this.type}) : super(key: key);

  @override
  State<ProfileFollows> createState() => _ProfileFollowsState();
}

class _ProfileFollowsState extends State<ProfileFollows> with AutomaticKeepAliveClientMixin<ProfileFollows> {
  CursorPagingState<int?, UserWithExtra, int> _pagingState = CursorPagingState();

  final int _pageSize = 200;

  @override
  bool get wantKeepAlive => true;

  Future<void> _fetchNextPage() async {
    if (_pagingState.isLoading) return;

    setState(() {
      _pagingState = _pagingState.copyWithEx(isLoading: true, error: null);
    });

    try {
      var result = await Twitter.getProfileFollows(
        widget.user.screenName!,
        widget.type,
        cursor: _pagingState.cursor,
        count: _pageSize,
      );

      if (!mounted) {
        return;
      }

      bool hasNextPage = result.users.isNotEmpty;
      setState(() {
        _pagingState = _pagingState.copyWithEx(
          pages: [...?_pagingState.pages, result.users],
          keys: [...?_pagingState.keys, result.cursorBottom],
          hasNextPage: hasNextPage,
          isLoading: false,
        );
      });

    }
    catch (err, stk) {
      if (mounted) {
        setState(() {
          _pagingState = _pagingState.copyWithEx(
            error: [err, stk],
            isLoading: false,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type == 'following' ? L10n.of(context).following : L10n.of(context).followers),
      ),
      body: PagedListView<int?, UserWithExtra>(
        padding: EdgeInsets.zero,
        addAutomaticKeepAlives: false,
        state: _pagingState,
        fetchNextPage: _fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, user, index) => UserTile(user: UserSubscription.fromUser(user)),
          firstPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
            error: (_pagingState.error as List)[0],
            stackTrace: (_pagingState.error as List)[1],
            prefix: L10n.of(context).unable_to_load_the_list_of_follows,
            onRetry: () => _fetchNextPage,
          ),
          newPageErrorIndicatorBuilder: (context) => FullPageErrorWidget(
            error:  (_pagingState.error as List)[0],
            stackTrace: (_pagingState.error as List)[1],
            prefix: L10n.of(context).unable_to_load_the_next_page_of_follows,
            onRetry: () => _fetchNextPage,
          ),
          noItemsFoundIndicatorBuilder: (context) {
            var text = widget.type == 'following'
              ? L10n.of(context).this_user_does_not_follow_anyone
              : L10n.of(context).this_user_does_not_have_anyone_following_them;

            return Center(
              child: Text(text),
            );
          },
        ),
      )
    );
  }
}
