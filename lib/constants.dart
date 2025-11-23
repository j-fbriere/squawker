const optionWizardCompleted = 'option.wizard_completed';

const optionDisableScreenshots = 'disable_screenshots';

const optionErrorsEnabled = 'errors._enabled';

const optionHelloLastBuild = 'hello.last_build';

const optionHomePages = 'home.pages';
const optionHomeInitialTab = 'home.initial_tab';
const optionNavigationAnimations = 'home.navigation_animations';
const optionHomeShowTabLabels = 'home.show_tab_labels';

const optionMediaSize = 'media.size';
const optionMediaDefaultMute = 'media.mute';
const optionMediaAllowBackgroundPlay = 'media.allow_background_play';
const optionMediaAllowBackgroundPlayOtherApps = 'media.allow_background_play.other_apps';

const optionDownloadType = 'download.type';
const optionDownloadPath = 'download.path';

const optionDownloadBestVideoQuality = 'download_best_video_quality';

const optionDownloadTypeDirectory = 'directory';
const optionDownloadTypeAsk = 'ask';

const optionLocale = 'locale';
const optionLocaleDefault = 'system';

const optionShouldCheckForUpdates = 'should_check_for_updates';
const optionShareBaseUrl = 'share_base_url';
const optionProxy = 'proxy';

const optionSubscriptionGroupsOrderByAscending = 'subscription_groups.order_by.ascending';
const optionSubscriptionGroupsOrderByField = 'subscription_groups.order_by.field';
const optionSubscriptionOrderByAscending = 'subscription.order_by.ascending';
const optionSubscriptionOrderCustom = 'subscription.order_by.custom';
const optionSubscriptionOrderByField = 'subscription.order_by.field';
const optionSubscriptionInitialTab = 'subscription.initial_tab';

const optionThemeMode = 'theme.mode';
const optionThemeTrueBlack = 'theme.true_black';
const optionThemeColorScheme = 'theme.color_scheme';

const optionTranslators = 'translators';

const optionTweetsHideSensitive = 'tweets.hide_sensitive';

const optionUserTrendsLocations = 'trends.locations';

const optionNonConfirmationBiasMode = 'other.improve_non_confirmation_bias';

const optionKeepFeedOffset = 'keep_feed_offset';
const optionLeanerFeeds = 'leaner_feeds';
const optionExclusionsFeed = 'exclusions_feed';
const optionEnhancedFeeds = 'enhanced_feeds';
const optionEnhancedSearches = 'enhanced_searches';
const optionEnhancedProfile = 'enhanced_profile';
const optionConfirmClose = 'confirm_close';

const optionTweetFontSize = 'tweet_font_size';

const optionTwitterAccountTypes = 'twitter_account_types';

const routeHome = '/';
const routeGroup = '/group';
const routeProfile = '/profile';
const routeSearch = '/search';
const routeSettings = '/settings';
const routeSettingsExport = '/settings/export';
const routeSettingsHome = '/settings/home';
const routeStatus = '/status';
const routeSubscriptionsImport = '/subscriptions/import';

const twitterAccountTypesPriorityToRegular = 'twitter_account_types_priority_to_regular';
const twitterAccountTypesBoth = 'twitter_account_types_both';
const twitterAccountTypesOnlyRegular = 'twitter_account_types_only_regular';

// Default instance of https://github.com/Teskann/x-client-transaction-id-generator
const String optionXClientTransactionIdProviderDefaultDomain = 'x-client-transaction-id-generator.xyz';

const String optionXClientTransactionIdProvider = 'x_client_transaction_id_provider';

const String bearerToken =
    "Bearer AAAAAAAAAAAAAAAAAAAAANRILgAAAAAAnNwIzUejRCOuH5E6I8xnZz4puTs%3D1Zv7ttfk8LF81IUq16cHjhLTvJu4FA33AGWWjCpTnA";

final Map<String, String> userAgentHeader = {
  'user-agent':
  "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Mobile Safari/537.3",
  "Pragma": "no-cache",
  "Cache-Control": "no-cache"
  // "If-Modified-Since": "Sat, 1 Jan 2000 00:00:00 GMT",
};
