import 'dart:async';
import 'dart:convert';
import 'dart:io';
//import 'package:device_preview/device_preview.dart';
import 'package:faker/faker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:logging_to_logcat/logging_to_logcat.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pref/pref.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:squawker/client/accounts.dart';
import 'package:squawker/client/app_http_client.dart';
import 'package:squawker/client/client_account.dart';
import 'package:squawker/client/login_webview.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/group/group_model.dart';
import 'package:squawker/group/group_screen.dart';
import 'package:squawker/home/home_model.dart';
import 'package:squawker/home/home_screen.dart';
import 'package:squawker/import_data_model.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/saved/saved_tweet_model.dart';
import 'package:squawker/search/search.dart';
import 'package:squawker/search/search_model.dart';
import 'package:squawker/settings/settings.dart';
import 'package:squawker/settings/settings_export_screen.dart';
import 'package:squawker/status.dart';
import 'package:squawker/subscriptions/_import.dart';
import 'package:squawker/subscriptions/users_model.dart';
import 'package:squawker/trends/trends_model.dart';
import 'package:squawker/tweet/_video.dart';
import 'package:squawker/ui/errors.dart';
import 'package:squawker/utils/accent_util.dart';
import 'package:squawker/utils/data_service.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/utils/misc.dart';
import 'package:squawker/utils/notifiers.dart';
import 'package:squawker/utils/translation.dart';
import 'package:squawker/utils/urls.dart';
import 'package:timeago/timeago.dart' as timeago;

Future checkForUpdates() async {
  Logger.root.info('Checking for updates');

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final client = HttpClient();
  client.userAgent = faker.internet.userAgent();

  final request = await client.getUrl(Uri.parse("https://api.github.com/repos/j-fbriere/squawker/releases/latest"));
  final response = await request.close();

  if (response.statusCode == 200) {
    final contentAsString = await utf8.decodeStream(response);
    final Map<dynamic, dynamic> map = json.decode(contentAsString);
    //print('*** map["tag_name"]=${map["tag_name"]}, packageInfo.version=${packageInfo.version}');
    if (map["tag_name"] != null) {
      if (map["tag_name"].compareTo('v${packageInfo.version}') > 0) {
        await requestPostNotificationsPermissions(() async {
          await FlutterLocalNotificationsPlugin().show(
              0,
              'An update for Squawker is available! 🚀',
              'View version ${map["tag_name"]} on Github',
              const NotificationDetails(
                  android: AndroidNotificationDetails(
                    'updates',
                    'Updates',
                    channelDescription: 'When a new app update is available show a notification',
                    importance: Importance.max,
                    priority: Priority.high,
                    showWhen: false,
                  )),
              payload: map['html_url']);
        });
      } else if (map['html_url'].isEmpty) {
        Logger.root.severe('Unable to check for updates');
      }
    }
  }
}

Future<void> checkForAccounts(context) async {
  Logger.root.info('Checking for accounts');

  final accounts = await TwitterAccount.initCheckXAccounts(forceInit: true);
  if (accounts.isEmpty) {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("⚠️ ${L10n.of(context).not_logged_in}"),
          content: Text(L10n.of(context).doesnt_work_without_account),
          actions: [
            TextButton(
              child: Text(L10n.of(context).close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(L10n.of(context).login),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TwitterLoginWebview()));
              },
            ),
          ],
        );
      },
    );
  }
}


class UnableToCheckForUpdatesException {
  final String body;

  UnableToCheckForUpdatesException(this.body);

  @override
  String toString() {
    return 'Unable to check for updates: {body: $body}';
  }
}

setTimeagoLocales() {
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('az', timeago.AzMessages());
  timeago.setLocaleMessages('ca', timeago.CaMessages());
  timeago.setLocaleMessages('cs', timeago.CsMessages());
  timeago.setLocaleMessages('da', timeago.DaMessages());
  timeago.setLocaleMessages('de', timeago.DeMessages());
  timeago.setLocaleMessages('dv', timeago.DvMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('es', timeago.EsMessages());
  timeago.setLocaleMessages('fa', timeago.FaMessages());
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  timeago.setLocaleMessages('gr', timeago.GrMessages());
  timeago.setLocaleMessages('he', timeago.HeMessages());
  timeago.setLocaleMessages('he', timeago.HeMessages());
  timeago.setLocaleMessages('hi', timeago.HiMessages());
  timeago.setLocaleMessages('id', timeago.IdMessages());
  timeago.setLocaleMessages('it', timeago.ItMessages());
  timeago.setLocaleMessages('ja', timeago.JaMessages());
  timeago.setLocaleMessages('km', timeago.KmMessages());
  timeago.setLocaleMessages('ko', timeago.KoMessages());
  timeago.setLocaleMessages('ku', timeago.KuMessages());
  timeago.setLocaleMessages('mn', timeago.MnMessages());
  timeago.setLocaleMessages('ms_MY', timeago.MsMyMessages());
  timeago.setLocaleMessages('nb_NO', timeago.NbNoMessages());
  timeago.setLocaleMessages('nl', timeago.NlMessages());
  timeago.setLocaleMessages('nn_NO', timeago.NnNoMessages());
  timeago.setLocaleMessages('pl', timeago.PlMessages());
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  timeago.setLocaleMessages('ro', timeago.RoMessages());
  timeago.setLocaleMessages('ru', timeago.RuMessages());
  timeago.setLocaleMessages('sv', timeago.SvMessages());
  timeago.setLocaleMessages('ta', timeago.TaMessages());
  timeago.setLocaleMessages('th', timeago.ThMessages());
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  timeago.setLocaleMessages('uk', timeago.UkMessages());
  timeago.setLocaleMessages('vi', timeago.ViMessages());
  timeago.setLocaleMessages('zh_CN', timeago.ZhCnMessages());
  timeago.setLocaleMessages('zh', timeago.ZhMessages());
}

Future<void> main() async {

  Logger.root.activateLogcat();
  Logger.root.level = Level.ALL;

  if (Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  WidgetsFlutterBinding.ensureInitialized();

  setTimeagoLocales();

  final prefService = await PrefServiceShared.init(prefix: 'pref_', defaults: {
    optionDisableScreenshots: false,
    optionDownloadPath: '',
    optionDownloadType: optionDownloadTypeAsk,
    optionHomePages: defaultHomePages.map((e) => e.id).toList(),
    optionLocale: optionLocaleDefault,
    optionHomeInitialTab: 'feed',
    optionNavigationAnimations: true,
    optionHomeShowTabLabels: true,
    optionSubscriptionInitialTab: 'tweets',
    optionMediaSize: 'medium',
    optionMediaDefaultMute: true,
    optionMediaAllowBackgroundPlay: true,
    optionMediaAllowBackgroundPlayOtherApps: true,
    optionNonConfirmationBiasMode: false,
    optionDownloadBestVideoQuality: false,
    optionShouldCheckForUpdates: (getFlavor() != 'play' && getFlavor() != 'fdroid') ? true : false,
    optionSubscriptionGroupsOrderByAscending: true,
    optionSubscriptionGroupsOrderByField: 'name',
    optionSubscriptionOrderByAscending: true,
    optionSubscriptionOrderByField: 'name',
    optionSubscriptionOrderCustom: '',
    optionThemeMode: 'system',
    optionThemeTrueBlack: false,
    optionThemeColorScheme: 'mango',
    optionTweetsHideSensitive: false,
    optionKeepFeedOffset: false,
    optionLeanerFeeds: false,
    optionExclusionsFeed: '',
    optionConfirmClose: true,
    optionEnhancedFeeds: true,
    optionEnhancedSearches: true,
    optionEnhancedProfile: true,
    optionTwitterAccountTypes: twitterAccountTypesPriorityToRegular,
    optionUserTrendsLocations: jsonEncode({
      'active': {'name': 'Worldwide', 'woeid': 1},
      'locations': [
        {'name': 'Worldwide', 'woeid': 1}
      ]
    }),
  });

  await AccentUtil.load();

  TwitterAccount.currentAccountTypes = prefService.get(optionTwitterAccountTypes);

  FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

  const InitializationSettings settings =
      InitializationSettings(android: AndroidInitializationSettings('@drawable/ic_notification'));

  await notifications.initialize(settings, onDidReceiveNotificationResponse: (response) async {
    var payload = response.payload;
    if (payload != null && payload.startsWith('https://')) {
      await openUri(payload);
    }
  });

  var shouldCheckForUpdates = prefService.get(optionShouldCheckForUpdates);
  if (shouldCheckForUpdates) {
    // Don't check for updates if user disabled it.
    checkForUpdates();
  }

  // Run the migrations early, so models work. We also do this later on so we can display errors to the user
  try {
    await Repository().migrate();
  } catch (e, _) {
    Logger.root.severe(e.toString());
  }

  var importDataModel = ImportDataModel();

  var twitterTokensModel = TwitterTokensModel();
  await twitterTokensModel.reloadTokens();

  var groupsModel = GroupsModel(prefService);
  await groupsModel.reloadGroups();

  var homeModel = HomeModel(prefService, groupsModel);
  await homeModel.loadPages();

  var subscriptionsModel = SubscriptionsModel(prefService, groupsModel);
  await subscriptionsModel.reloadSubscriptions();

  var trendLocationModel = UserTrendLocationModel(prefService);

  await TwitterAccount.loadAllTwitterTokensAndRateLimits();

  AppHttpClient.setProxy(prefService.get(optionProxy));

  TranslationAPI.setTranslationHostsFromStr(prefService.get(optionTranslators));

  runApp(PrefService(
    service: prefService,
    child: MultiProvider(
      providers: [
        Provider(create: (context) => groupsModel),
        Provider(create: (context) => homeModel),
        ChangeNotifierProvider(create: (context) => importDataModel),
        Provider(create: (context) => twitterTokensModel),
        Provider(create: (context) => subscriptionsModel),
        Provider(create: (context) => SavedTweetModel()),
        Provider(create: (context) => SearchTweetsModel()),
        Provider(create: (context) => SearchUsersModel()),
        Provider(create: (context) => trendLocationModel),
        Provider(create: (context) => TrendLocationsModel()),
        Provider(create: (context) => TrendsModel(trendLocationModel)),
        ChangeNotifierProvider(create: (_) => VideoContextState(prefService.get(optionMediaDefaultMute))),
        ChangeNotifierProvider(create: (_) => AccountAddedNotifier()),
      ],
      child: /*DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => */const SquawkerApp(),
      /*),*/
    )
  ));
}

class SquawkerApp extends StatefulWidget {
  const SquawkerApp({Key? key}) : super(key: key);

  @override
  State<SquawkerApp> createState() => _SquawkerAppState();
}

class _SquawkerAppState extends State<SquawkerApp> with WidgetsBindingObserver {
  static final log = Logger('_SquawkerAppState');

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  String _themeMode = 'system';
  bool _trueBlack = false;
  FlexScheme _colorScheme = FlexScheme.mango;
  bool _accentColor = false;
  Locale? _locale;
  final _MyRouteObserver _routeObserver = _MyRouteObserver();
  bool _accountDialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var prefService = PrefService.of(context);

    void setLocale(String? locale) {
      if (locale == null || locale == optionLocaleDefault) {
        _locale = null;
      } else {
        var splitLocale = locale.split('_');
        if (splitLocale.length == 1) {
          _locale = L10n.delegate.supportedLocales.firstWhereOrNull((e) => e.languageCode == splitLocale[0]);
        }
        else if (splitLocale.length == 2) {
          if (splitLocale[1].length == 2) {
            _locale = L10n.delegate.supportedLocales.firstWhereOrNull((e) => e.languageCode == splitLocale[0] && e.countryCode == splitLocale[1]);
          }
          else { // splitLocale[1].length == 4
            _locale = L10n.delegate.supportedLocales.firstWhereOrNull((e) => e.languageCode == splitLocale[0] && e.scriptCode == splitLocale[1]);
          }
        }
        else { // splitLocale.length == 3
          _locale = L10n.delegate.supportedLocales.firstWhereOrNull((e) => e.languageCode == splitLocale[0] && e.scriptCode == splitLocale[1] && e.countryCode == splitLocale[2]);
        }
      }
    }

    void setColorScheme(String colorSchemeName) {
      _colorScheme = colorSchemeName != 'accent' ? FlexScheme.values.byName(colorSchemeName) : FlexScheme.materialBaseline;
      _accentColor = colorSchemeName != 'accent' ? false : true;
    }

    // TODO: This doesn't work on iOS
    void setDisableScreenshots(final bool secureModeEnabled) async {
      if (secureModeEnabled) {
        await FlutterWindowManagerPlus.addFlags(FlutterWindowManagerPlus.FLAG_SECURE);
      } else {
        await FlutterWindowManagerPlus.clearFlags(FlutterWindowManagerPlus.FLAG_SECURE);
      }
    }

    // Set any already-enabled preferences
    setState(() {
      setLocale(prefService.get<String>(optionLocale));
      _themeMode = prefService.get(optionThemeMode);
      _trueBlack = prefService.get(optionThemeTrueBlack);
      setColorScheme(prefService.get(optionThemeColorScheme));
      setDisableScreenshots(prefService.get(optionDisableScreenshots));
    });

    prefService.addKeyListener(optionShouldCheckForUpdates, () {
      setState(() {});
    });

    prefService.addKeyListener(optionLocale, () {
      setState(() {
        setLocale(prefService.get<String>(optionLocale));
      });
    });

    // Whenever the "true black" preference is toggled, apply the toggle
    prefService.addKeyListener(optionThemeTrueBlack, () {
      setState(() {
        _trueBlack = prefService.get(optionThemeTrueBlack);
      });
    });

    prefService.addKeyListener(optionThemeMode, () {
      setState(() {
        _themeMode = prefService.get(optionThemeMode);
      });
    });

    prefService.addKeyListener(optionThemeColorScheme, () {
      setState(() {
        setColorScheme(prefService.get(optionThemeColorScheme));
      });
    });

    prefService.addKeyListener(optionDisableScreenshots, () {
      setState(() {
        setDisableScreenshots(prefService.get(optionDisableScreenshots));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool navigationAnimationsEnabled = PrefService.of(context).get(optionNavigationAnimations);
    ThemeMode themeMode;
    switch (_themeMode) {
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'system':
        themeMode = ThemeMode.system;
        break;
      default:
        log.warning('Unknown theme mode preference: $_themeMode');
        themeMode = ThemeMode.system;
        break;
    }

    ThemeData light = FlexThemeData.light(
      colors: _accentColor ? AccentUtil.lightAccentColors : null,
      scheme: _colorScheme,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      tabBarStyle: FlexTabBarStyle.flutterDefault,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3ErrorColors: true,
      useMaterial3: true,
      appBarStyle: FlexAppBarStyle.primary,
    );
    ThemeData dark = FlexThemeData.dark(
      colors: _accentColor ? AccentUtil.darkAccentColors : null,
      scheme: _colorScheme,
      darkIsTrueBlack: _trueBlack,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      tabBarStyle: FlexTabBarStyle.flutterDefault,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3ErrorColors: true,
      useMaterial3: true,
      appBarStyle: _trueBlack ? FlexAppBarStyle.surface : FlexAppBarStyle.primary,
    );
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localeListResolutionCallback: (locales, supportedLocales) {
        List supportedLocalesCountryCode = [];
        List supportedLocalesScriptCode = [];
        List supportedLocalesLanguageCode = [];
        for (var item in supportedLocales) {
          if (item.countryCode != null) {
            supportedLocalesCountryCode.add(item.countryCode);
          }
          if (item.scriptCode != null) {
            supportedLocalesScriptCode.add(item.scriptCode);
          }
          supportedLocalesLanguageCode.add(item.languageCode);
        }

        List localesCountryCode = [];
        List localesScriptCode = [];
        List localesLanguageCode = [];
        for (var item in locales!) {
          localesCountryCode.add(item.countryCode);
          localesScriptCode.add(item.scriptCode);
          localesLanguageCode.add(item.languageCode);
        }

        for (var i = 0; i < locales.length; i++) {
          if (supportedLocalesCountryCode.contains(localesCountryCode[i]) &&
              supportedLocalesScriptCode.contains(localesScriptCode[i]) &&
              supportedLocalesLanguageCode.contains(localesLanguageCode[i])) {
            log.info('*** Locale Country: ${localesCountryCode[i]}, Script: ${localesScriptCode[i]}, Language: ${localesLanguageCode[i]}');
            return Locale.fromSubtags(countryCode: localesCountryCode[i], scriptCode: localesScriptCode[i], languageCode: localesLanguageCode[i]);
          }
          else if (supportedLocalesCountryCode.contains(localesCountryCode[i]) &&
                   supportedLocalesLanguageCode.contains(localesLanguageCode[i])) {
            log.info('*** Locale Country: ${localesCountryCode[i]}, Language: ${localesLanguageCode[i]}');
            return Locale.fromSubtags(countryCode: localesCountryCode[i], languageCode: localesLanguageCode[i]);
          }
          else if (supportedLocalesScriptCode.contains(localesScriptCode[i]) &&
                   supportedLocalesLanguageCode.contains(localesLanguageCode[i])) {
            log.info('*** Locale Script: ${localesScriptCode[i]}, Language: ${localesLanguageCode[i]}');
            return Locale.fromSubtags(scriptCode: localesScriptCode[i], languageCode: localesLanguageCode[i]);
          }
          else if (supportedLocalesLanguageCode.contains(localesLanguageCode[i])) {
            log.info('*** Locale Language: ${localesLanguageCode[i]}');
            return Locale.fromSubtags(languageCode: localesLanguageCode[i]);
          }
          else {
            log.info('*** No Locale, so Language: en');
          }
        }
        return const Locale('en');
      },
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      locale: _locale ?? const Locale('en-US'), //DevicePreview.locale(context),
      title: 'Squawker',
      theme: light.copyWith(
        tabBarTheme: light.tabBarTheme.copyWith(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade400.lighten(),
        ),
      ),
      darkTheme: dark.copyWith(
        tabBarTheme: dark.tabBarTheme.copyWith(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade400.lighten(),
        ),
      ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: routeHome,
      navigatorObservers: [
        _routeObserver
      ],
      onGenerateRoute: (settings) {
        if (settings.name == routeHome) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const DefaultPage())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const DefaultPage());
        }
        else if (settings.name == routeGroup) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const GroupScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const GroupScreen());
        }
        else if (settings.name == routeProfile) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const ProfileScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const ProfileScreen());
        }
        else if (settings.name == routeSearch) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const SearchScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const SearchScreen());
        }
        else if (settings.name == routeSettings) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const SettingsScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const SettingsScreen());
        }
        else if (settings.name == routeSettingsExport) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const SettingsExportScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const SettingsExportScreen());
        }
        else if (settings.name == routeSettingsHome) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const SettingsScreen(initialPage: 'home'))
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const SettingsScreen(initialPage: 'home'));
        }
        else if (settings.name == routeStatus) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const StatusScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const StatusScreen());
        }
        else if (settings.name == routeSubscriptionsImport) {
          return navigationAnimationsEnabled
            ? MaterialPageRoute(builder: (context) => const SubscriptionImportScreen())
            : PageRouteBuilder(pageBuilder: (context, anim1, anim2) => const SubscriptionImportScreen());
        }
        return null;
      },
      builder: (context, child) {

        if (!_accountDialogShown) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            _accountDialogShown = true;
            await checkForAccounts(_navigatorKey.currentContext!);
          });
        }

        // Replace the default red screen of death with a slightly friendlier one
        ErrorWidget.builder = (FlutterErrorDetails details) => FullPageErrorWidget(
              error: details.exception,
              stackTrace: details.stack,
              prefix: L10n.of(context).something_broke_in_fritter,
            );

        return child ?? Container(); //DevicePreview.appBuilder(context, child ?? Container());
      },
    );
  }
}

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  Object? _migrationError;
  StackTrace? _migrationStackTrace;

  @override
  void initState() {
    super.initState();

    // Run the database migrations
    Repository().migrate().catchError((e, s) {
      setState(() {
        _migrationError = e;
        _migrationStackTrace = s;
      });
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_migrationError != null || _migrationStackTrace != null) {
      return ScaffoldErrorWidget(
          error: _migrationError,
          stackTrace: _migrationStackTrace,
          prefix: L10n.of(context).unable_to_run_the_database_migrations);
    }

    return WillPopScope(
        onWillPop: () async {
          var prefService = PrefService.of(context);
          if (!prefService.get(optionConfirmClose)) {
            return true;
          }
          var result = await showDialog<bool>(
            context: context,
            builder: (c) => AlertDialog(
              title: Text(L10n.current.are_you_sure),
              content: Text(L10n.current.confirm_close_fritter),
              actions: [
                TextButton(
                  child: Text(L10n.current.no),
                  onPressed: () => Navigator.pop(c, false),
                ),
                TextButton(
                  child: Text(L10n.current.yes),
                  onPressed: () => Navigator.pop(c, true),
                ),
              ],
            ));

          return result ?? false;
        },
        child: const HomeScreen());
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPop(route, previousRoute);
    if (previousRoute != null && previousRoute is PageRoute) {
      if (previousRoute.settings.name == '/') {
        if (DataService().map.containsKey('toggleKeepFeed')) {
          var navigationKey = DataService().map['navigationKey'];
          if (navigationKey != null && navigationKey.currentState != null) {
            navigationKey.currentState!.fromFeedToSubscriptions();
          }
        }
      }
    }
  }

}
