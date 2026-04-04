import 'package:extended_image/extended_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/entities.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/profile/_follows.dart';
import 'package:squawker/profile/_saved.dart';
import 'package:squawker/profile/_tweets.dart';
import 'package:squawker/profile/profile_model.dart';
import 'package:squawker/search/search.dart';
import 'package:squawker/tweet/_media.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/user.dart';
import 'package:squawker/utils/urls.dart';
import 'package:squawker/utils/route_util.dart';
import 'package:intl/intl.dart';
import 'package:measure_size/measure_size.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';

typedef TabTitleBuilder = String Function(BuildContext context);

class NavigationTab {
  final String id;
  final TabTitleBuilder titleBuilder;

  NavigationTab(this.id, this.titleBuilder);
}

final List<NavigationTab> defaultSubscriptionTabs = [
  NavigationTab('tweets', (c) => L10n.of(c).tweets),
  NavigationTab('tweets_and_replies', (c) => L10n.of(c).tweets_and_replies),
  NavigationTab('media', (c) => L10n.of(c).media),
  NavigationTab('saved', (c) => L10n.of(c).saved),
];

class ProfileScreenArguments {
  final String? id;
  final String? screenName;

  ProfileScreenArguments(this.id, this.screenName);

  factory ProfileScreenArguments.fromId(String id) {
    return ProfileScreenArguments(id, null);
  }

  factory ProfileScreenArguments.fromScreenName(String screenName) {
    return ProfileScreenArguments(null, screenName);
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = getNamedRouteArguments(routeProfile) as ProfileScreenArguments;

    return Provider(
        create: (context) {
          if (args.id != null && TwitterAccount.hasAccountAvailable()) {
            return ProfileModel()..loadProfileById(args.id!);
          } else {
            return ProfileModel()..loadProfileByScreenName(args.screenName!);
          }
        },
        child: _ProfileScreen(id: args.id, screenName: args.screenName));
  }
}

class _ProfileScreen extends StatelessWidget {
  final String? id;
  final String? screenName;

  const _ProfileScreen({Key? key, required this.id, required this.screenName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = PrefService.of(context, listen: false);
    return Scaffold(
      body: ScopedBuilder<ProfileModel, Profile>.transition(
        store: context.read<ProfileModel>(),
        onError: (_, error) => FullPageErrorWidget(
          error: error,
          stackTrace: null,
          prefix: L10n.of(context).unable_to_load_the_profile,
          onRetry: () {
            if (id != null && TwitterAccount.hasAccountAvailable()) {
              return context.read<ProfileModel>().loadProfileById(id!);
            } else {
              return context.read<ProfileModel>().loadProfileByScreenName(screenName!);
            }
          },
        ),
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, state) => ProfileScreenBody(prefs: prefs, profile: state),
      ),
    );
  }
}

class ProfileScreenBody extends StatefulWidget {
  final BasePrefService prefs;
  final Profile profile;

  const ProfileScreenBody({Key? key, required this.prefs, required this.profile}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> with TickerProviderStateMixin {
  static const defaultHeight = 256.12345;

  final GlobalKey<NestedScrollViewState> nestedScrollViewKey = GlobalKey<NestedScrollViewState>();

  late TabController _tabController;

  bool _showBackToTopButton = false;

  double descriptionHeight = defaultHeight;
  double metadataHeight = defaultHeight;

  bool descriptionResized = false;
  bool metadataResized = false;

  NumberFormat numberFormat = NumberFormat.compact();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var nestedScrollViewState = nestedScrollViewKey.currentState;
      if (nestedScrollViewState == null) {
        return;
      }

      nestedScrollViewState.innerController.addListener(_listen);
    });

    String initialTabStr = widget.prefs.get(optionSubscriptionInitialTab);
    int initialTabIdx = defaultSubscriptionTabs.indexWhere((e) => e.id == initialTabStr);

    _tabController = TabController(length: 4, vsync: this, initialIndex: initialTabIdx);

    var description = widget.profile.user.description;
    if (description == null || description.isEmpty) {
      descriptionHeight = 0;
      descriptionResized = true;
    }
  }

  @override
  void dispose() {
    nestedScrollViewKey.currentState?.innerController.removeListener(_listen);

    super.dispose();
  }

  void _listen() {
    var nestedScrollViewState = nestedScrollViewKey.currentState;
    if (nestedScrollViewState == null) {
      return;
    }

    if (!nestedScrollViewState.innerController.hasClients) {
      return;
    }

    // Show the "scroll to top" button if we scroll down a bit, and hide it if we go back above
    if (nestedScrollViewState.innerController.positions.any((element) => element.pixels >= 400)) {
      if (!_showBackToTopButton) {
        setState(() {
          _showBackToTopButton = true;
        });
      }
    } else {
      if (_showBackToTopButton) {
        setState(() {
          _showBackToTopButton = false;
        });
      }
    }
  }

  void _scrollToTop() {
    // We scroll the outer controller (the whole nested scroll view and children) to the top
    // TODO: No animation due to Flutter crashing on huge lists (https://github.com/flutter/flutter/issues/52207) (#607)
    nestedScrollViewKey.currentState?.outerController.jumpTo(0);
  }

  List<InlineSpan> _addLinksToText(BuildContext context, String content) {
    List<InlineSpan> contentWidgets = [];

    // Split the string by any mentions or hashtags, and turn those into links
    content.splitMapJoin(RegExp(r'(#|(?<=\W|^)@)\w+'), onMatch: (match) {
      var full = match.group(0);
      var type = match.group(1);
      if (type == null || full == null) {
        return '';
      }

      var onTap = () async {};
      if (type == '#') {
        onTap = () async {
          pushNamedRoute(context, routeSearch, SearchArguments(1, focusInputOnOpen: false, query: full));
        };
      }

      if (type == '@') {
        onTap = () async {
          pushNamedRoute(context, routeProfile, ProfileScreenArguments.fromScreenName(full.substring(1)));
        };
      }

      contentWidgets.add(TextSpan(
          text: full,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          recognizer: TapGestureRecognizer()..onTap = onTap));

      return type;
    }, onNonMatch: (text) {
      contentWidgets.add(TextSpan(text: text));

      return text;
    });

    return contentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    TwitterAccount.setCurrentContext(context);
    // TODO: This shouldn't happen before the profile is loaded
    var user = widget.profile.user;
    if (user.idStr == null) {
      return Container();
    }

    // Make the app bar height the correct aspect ratio based on the header image size (1500x500)
    var mediaQuery = MediaQuery.of(context);
    var deviceSize = mediaQuery.size;
    var bannerHeight = deviceSize.width * (500 / 1500);
    var avatarHeight = 80;

    var profileImageTop = bannerHeight + 16 - 36 - mediaQuery.padding.top;
    var profileStuffTop = bannerHeight + 36;

    var theme = Theme.of(context);

    var banner = user.profileBannerUrl;
    var bannerImage = banner == null
        ? Container(height: bannerHeight, color: Colors.white)
        : ExtendedImage.network(banner, fit: BoxFit.fitWidth, height: bannerHeight);

    // The height of the app bar should be all the inner components, plus any margins
    var appBarHeight = profileStuffTop + avatarHeight + metadataHeight + 8 + descriptionHeight;

    var metadataTextStyle = const TextStyle(fontSize: 12.5);
    var prefs = PrefService.of(context, listen: false);

    return Scaffold(
      body: Stack(children: [
        ExtendedNestedScrollView(
          key: nestedScrollViewKey,
          onlyOneScrollInBody: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: appBarHeight,
                floating: true,
                pinned: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Text(
                        defaultSubscriptionTabs[0].titleBuilder(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tab(
                      child: Text(
                        defaultSubscriptionTabs[1].titleBuilder(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tab(
                      child: Text(
                        defaultSubscriptionTabs[2].titleBuilder(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tab(
                      child: Text(
                        defaultSubscriptionTabs[3].titleBuilder(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: SafeArea(
                  top: false,
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: Colors.white),
                    child: Stack(fit: StackFit.expand, children: <Widget>[
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: <Color>[Color(0xDD000000), Color(0x80000000)],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(16, profileStuffTop, 16, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(user.name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                        ),
                                        if (user.verified ?? false) const SizedBox(width: 6),
                                        if (user.verified ?? false)
                                          Icon(Symbols.verified_rounded,
                                              size: 24, color: Theme.of(context).primaryColor)
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: Text('@${(user.screenName!)}',
                                          style: const TextStyle(fontSize: 14, color: Colors.white70)),
                                    ),
                                    if (user.description != null && user.description!.isNotEmpty)
                                      MeasureSize(
                                        onChange: (size) {
                                          setState(() {
                                            descriptionHeight = size.height;
                                            descriptionResized = true;
                                          });
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(bottom: 8),
                                            child: RichText(
                                                maxLines: 3,
                                                text: TextSpan(
                                                    style: const TextStyle(height: 1.4),
                                                    children: _addLinksToText(context, user.description!)))),
                                      ),
                                    MeasureSize(
                                      onChange: (size) {
                                        setState(() {
                                          metadataHeight = size.height;
                                          metadataResized = true;
                                        });
                                      },
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            if (user.friendsCount != null)
                                              InkWell(
                                                onTap: () => Navigator.of(context).push(
                                                  MaterialPageRoute(builder: ((context) => ProfileFollows(user: user, type: 'following')))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      const Icon(Icons.person_rounded, size: 12, color: Colors.white),
                                                      const SizedBox(width: 4),
                                                      Text.rich(TextSpan(children: [
                                                        TextSpan(
                                                            text: '${widget.profile.user.friendsCount}',
                                                            style: metadataTextStyle.copyWith(
                                                                fontWeight: FontWeight.w500)),
                                                        TextSpan(
                                                            text: ' ${L10n.current.following.toLowerCase()}',
                                                            style: metadataTextStyle)
                                                      ])),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (user.followersCount != null)
                                              InkWell(
                                                onTap: () => Navigator.of(context).push(
                                                  MaterialPageRoute(builder: ((context) => ProfileFollows(user: user, type: 'followers')))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      const Icon(Icons.person_rounded, size: 12, color: Colors.white),
                                                      const SizedBox(width: 4),
                                                      Text.rich(TextSpan(children: [
                                                        TextSpan(
                                                            text: '${widget.profile.user.followersCount}',
                                                            style: metadataTextStyle.copyWith(
                                                                fontWeight: FontWeight.w500)),
                                                        TextSpan(
                                                            text: ' ${L10n.current.followers.toLowerCase()}',
                                                            style: metadataTextStyle)
                                                      ])),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (user.location != null && user.location!.isNotEmpty)
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.location_on_rounded,
                                                        size: 12, color: Colors.white),
                                                    const SizedBox(width: 4),
                                                    Text(user.location!, style: metadataTextStyle),
                                                  ],
                                                ),
                                              ),
                                            if (user.url != null && user.url!.isNotEmpty)
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.link_rounded, size: 12, color: Colors.white),
                                                    const SizedBox(width: 4),
                                                    Builder(builder: (context) {
                                                      var url = user.entities?.url?.urls
                                                          ?.firstWhere((element) => element.url == user.url);

                                                      if (url == null) {
                                                        return Container();
                                                      }

                                                      var displayUrl = url.displayUrl ?? url.url;
                                                      var expandedUrl = url.expandedUrl ?? url.url;

                                                      var textStyle = metadataTextStyle;
                                                      if (displayUrl == null || expandedUrl == null) {
                                                        return Text(L10n.current.unsupported_url,
                                                            style: textStyle.copyWith(color: theme.hintColor));
                                                      }

                                                      return InkWell(
                                                        child: Text(displayUrl,
                                                            style: textStyle.copyWith(color: Colors.blue)),
                                                        onTap: () => openUri(expandedUrl),
                                                      );
                                                    }),
                                                  ],
                                                )),
                                            if (user.createdAt != null)
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.calendar_today_rounded,
                                                        size: 12, color: Colors.white),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                        L10n.of(context)
                                                            .joined(DateFormat('MMMM yyyy').format(user.createdAt!)),
                                                        style: metadataTextStyle),
                                                  ],
                                                ),
                                              ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                              child: bannerImage,
                              onTap: () {
                                if (banner == null) {
                                  return;
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TweetPhotoView(url: user.profileBannerUrl!, username: user.name!)));
                              })),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.fromLTRB(128, profileImageTop + 64, 16, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                            IconButton(
                              icon: const Icon(Symbols.search),
                              color: Colors.white,
                              onPressed: () => pushNamedRoute(context, routeSearch, SearchArguments(1, focusInputOnOpen: true, query: 'from:@${user.screenName!} ')),
                            ),
                            FollowButton(user: UserSubscription.fromUser(user), color: Colors.white),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(16, profileImageTop, 16, 16),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                              child: UserAvatar(uri: user.profileImageUrlHttps, size: 96),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TweetPhotoView(
                                          url: user.profileImageUrlHttps!.replaceFirst('_normal', ''),
                                          username: user.name!)))),
                        ),
                      )
                    ]),
                  ),
                )))
            ];
          },
          body: MultiProvider(
            providers: [
              ChangeNotifierProvider<TweetContextState>(
                  create: (_) => TweetContextState(prefs.get(optionTweetsHideSensitive)))
            ],
            child: TabBarView(
              controller: _tabController,
              children: [
                ProfileTweets(
                    user: user, type: 'profile', includeReplies: false, pinnedTweets: widget.profile.pinnedTweets),
                ProfileTweets(
                    user: user, type: 'profile', includeReplies: true, pinnedTweets: widget.profile.pinnedTweets),
                ProfileTweets(user: user, type: 'media', includeReplies: false, pinnedTweets: const []),
                ProfileSaved(user: user),
              ],
            ),
          ),
        ),

        // If we haven't resized the description widget yet, display an overlay container so we don't see the resize
        // TODO: This flickers
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: descriptionResized == true && metadataResized == true
              ? Container(key: const Key('loaded'))
              : Container(
                  key: const Key('waiting'),
                  height: double.infinity,
                  color: theme.colorScheme.background,
                ),
        )
      ]),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Symbols.arrow_upward_rounded),
            ),
    );
  }
}

class TweetContextState extends ChangeNotifier {
  bool hideSensitive;

  TweetContextState(this.hideSensitive);

  void setHideSensitive(bool value) {
    hideSensitive = value;
    notifyListeners();
  }
}
