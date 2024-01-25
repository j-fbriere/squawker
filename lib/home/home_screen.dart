import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/home/_feed.dart';
import 'package:squawker/home/_groups.dart';
import 'package:squawker/home/_missing.dart';
import 'package:squawker/home/_saved.dart';
import 'package:squawker/home/home_model.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/search/search.dart';
import 'package:squawker/status.dart';
import 'package:squawker/subscriptions/subscriptions.dart';
import 'package:squawker/trends/trends.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/utils/data_service.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

typedef NavigationTitleBuilder = String Function(BuildContext context);

class NavigationPage {
  final String id;
  final NavigationTitleBuilder titleBuilder;
  final IconData icon;

  NavigationPage(this.id, this.titleBuilder, this.icon);
}

List<Widget> createCommonAppBarActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.search_rounded),
      onPressed: () => Navigator.pushNamed(context, routeSearch, arguments: SearchArguments(0, focusInputOnOpen: true)),
    ),
    IconButton(
      icon: const Icon(Icons.settings_rounded),
      onPressed: () {
        Navigator.pushNamed(context, routeSettings);
      },
    )
  ];
}

final List<NavigationPage> defaultHomePages = [
  NavigationPage('feed', (c) => L10n.of(c).feed, Icons.rss_feed_rounded),
  NavigationPage('subscriptions', (c) => L10n.of(c).subscriptions, Icons.subscriptions_rounded),
  NavigationPage('groups', (c) => L10n.of(c).groups, Icons.group_rounded),
  NavigationPage('trending', (c) => L10n.of(c).trending, Icons.trending_up_rounded),
  NavigationPage('saved', (c) => L10n.of(c).saved, Icons.bookmark_border_rounded),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = PrefService.of(context);
    var model = context.read<HomeModel>();

    return _HomeScreen(prefs: prefs, model: model);
  }
}

class _HomeScreen extends StatefulWidget {
  final BasePrefService prefs;
  final HomeModel model;

  const _HomeScreen({Key? key, required this.prefs, required this.model}) : super(key: key);

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  static final log = Logger('_HomeScreenState');
  int _initialPage = 0;
  List<NavigationPage> _pages = [];
  StreamSubscription? _sub;
  bool _firstInit = false;
  final GlobalKey<FeedScreenState> _feedKey = GlobalKey<FeedScreenState>();
  final GlobalKey<ScaffoldWithBottomNavigationState> _navigationKey = GlobalKey<ScaffoldWithBottomNavigationState>();

  Future<void> handleInitialLink(Uri link) async {
    //if (kDebugMode) {
    log.info('****** handleInitialLink - link=$link');
    //}
    if (link.host == 't.co') {
      Uri lnk = await _resolveShortUrl(link);
      if (lnk.host != 't.co') {
        link = lnk;
      }
    }

    // Assume it's a username if there's only one segment (or two segments with the second empty, meaning the URI ends with /)
    if (link.pathSegments.length == 1 || (link.pathSegments.length == 2 && link.pathSegments.last.isEmpty)) {
      Navigator.pushNamed(context, routeProfile,
          arguments: ProfileScreenArguments.fromScreenName(link.pathSegments.first));
      return;
    }

    if (link.pathSegments.length == 2) {
      var secondSegment = link.pathSegments[1];

      // https://twitter.com/i/redirect?url=https%3A%2F%2Ftwitter.com%2Fi%2Ftopics%2Ftweet%2F1447290060123033601
      if (secondSegment == 'redirect') {
        // This is a redirect URL, so we should extract it and use that as our initial link instead
        var redirect = link.queryParameters['url'];
        if (redirect == null) {
          // TODO
          return;
        }

        await handleInitialLink(Uri.parse(redirect));
        return;
      }
    }

    if (link.pathSegments.length >= 3 && link.pathSegments[1] == 'status') {
      // Assume it's a tweet
      var username = link.pathSegments[0];
      var statusId = link.pathSegments[2];

      Navigator.pushNamed(context, routeStatus,
          arguments: StatusScreenArguments(
            id: statusId,
            username: username,
          ));
      return;
    }

    if (link.pathSegments.length == 4) {
      var segment2 = link.pathSegments[1];
      var segment3 = link.pathSegments[2];
      var segment4 = link.pathSegments[3];

      // https://twitter.com/i/topics/tweet/1447290060123033601
      if (segment2 == 'topics' && segment3 == 'tweet') {
        Navigator.pushNamed(context, routeStatus, arguments: StatusScreenArguments(id: segment4, username: null));
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    DataService().map['navigationKey'] = _navigationKey;

    widget.model.loadPages();
    _buildPages(widget.model.state);
    widget.model.observer(onState: _buildPages);
  }

  void _buildPages(List<HomePage> state) {
    var pages = state.where((element) => element.selected).map((e) => e.page).toList();

    if (widget.prefs.getKeys().contains(optionHomeInitialTab)) {
      _initialPage = max(0, pages.indexWhere((element) => element.id == widget.prefs.get(optionHomeInitialTab)));
    }

    setState(() {
      _pages = pages;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_firstInit) {
      _firstInit = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ReceiveSharingIntent.getInitialText().then((String? value) async {
          log.info('****** ReceiveSharingIntent.getInitialText - value=$value');
          if (value != null) {
            Uri? link = Uri.tryParse(value);
            if (link != null) {
              await handleInitialLink(link);
            }
          }
        });
        // Attach a listener to the stream
        _sub = ReceiveSharingIntent.getTextStream().listen((String value) async {
          log.info('****** ReceiveSharingIntent.getTextStream - value=$value');
          Uri? link = Uri.tryParse(value);
          if (link != null) {
            await handleInitialLink(link);
          }
        }, onError: (err) {
          // TODO: Handle exception by warning the user their action did not succeed
          log.info('****** ReceiveSharingIntent.getTextStream - err=$err');
        });
      });
    }
    return ScopedBuilder<HomeModel, List<HomePage>>.transition(
        store: widget.model,
        onError: (_, e) => ScaffoldErrorWidget(
              prefix: L10n.current.unable_to_load_home_pages,
              error: e,
              stackTrace: null,
              onRetry: () async => await widget.model.resetPages(),
              retryText: L10n.current.reset_home_pages,
            ),
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, state) {
          return ScaffoldWithBottomNavigation(
              key: _navigationKey,
              pages: _pages,
              initialPage: _initialPage,
              builder: (scrollController) {
                return [
                  ..._pages.map((e) {
                    if (e.id.startsWith('group-')) {
                      return FeedScreen(
                          scrollController: scrollController,
                          id: e.id.replaceAll('group-', ''),
                          name: e.titleBuilder(context));
                    }

                    switch (e.id) {
                      case 'feed':
                        return FeedScreen(
                            key: _feedKey, scrollController: scrollController, id: '-1', name: L10n.current.feed);
                      case 'subscriptions':
                        return const SubscriptionsScreen();
                      case 'groups':
                        return GroupsScreen(scrollController: scrollController);
                      case 'trending':
                        return TrendsScreen(scrollController: scrollController);
                      case 'saved':
                        return SavedScreen(scrollController: scrollController);
                      default:
                        return const MissingScreen();
                    }
                  })
                ];
              },
              feedKey: _feedKey);
        });
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }

  Future<Uri> _resolveShortUrl(Uri link) async {
    http.Request req = http.Request('Get', link)..followRedirects = false;
    http.Client baseClient = http.Client();
    http.StreamedResponse response = await baseClient.send(req);
    String? location = response.headers['location'];
    return location == null ? link : Uri.parse(location);
  }
}

class ScaffoldWithBottomNavigation extends StatefulWidget {
  final List<NavigationPage> pages;
  final int initialPage;
  final List<Widget> Function(ScrollController scrollController) builder;
  final GlobalKey<FeedScreenState>? feedKey;

  const ScaffoldWithBottomNavigation(
      {Key? key, required this.pages, required this.initialPage, required this.builder, required this.feedKey})
      : super(key: key);

  @override
  State<ScaffoldWithBottomNavigation> createState() => ScaffoldWithBottomNavigationState();
}

class ScaffoldWithBottomNavigationState extends State<ScaffoldWithBottomNavigation> {
  final ScrollController scrollController = ScrollController();

  late List<Widget> _children;
  List<NavigationPage> _pages = [
    NavigationPage('none', (context) => L10n.current.missing_page, Icons.disabled_by_default_rounded),
    NavigationPage('none', (context) => L10n.current.missing_page, Icons.disabled_by_default_rounded),
  ];

  List<NavigationPage> _padToMinimumPagesLength(List<NavigationPage> pages) {
    var widgetPages = pages;
    if (widgetPages.length < 2) {
      widgetPages.addAll(List.generate(2 - widgetPages.length, (index) {
        return NavigationPage('none', (context) => L10n.current.missing_page, Icons.disabled_by_default_rounded);
      }));
    }

    return widgetPages;
  }

  @override
  void didUpdateWidget(ScaffoldWithBottomNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);

    var newPages = _padToMinimumPagesLength(widget.pages);
    if (oldWidget.pages != widget.pages) {
      setState(() {
        _children = widget.builder(scrollController);
        _pages = newPages;
      });
    }
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    _children = widget.builder(scrollController);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        destinations: [
          ..._pages.map((e) => NavigationDestination(icon: Icon(e.icon, size: 22), label: e.titleBuilder(context)))
        ],
      ),
      body: _children[pageIndex],
    );
  }
}
