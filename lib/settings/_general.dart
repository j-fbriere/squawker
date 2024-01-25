import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/database/repository.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/home/home_screen.dart';
import 'package:squawker/profile/profile.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:squawker/utils/misc.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pref/pref.dart';

class SettingLocale {
  final String code;
  final String name;

  SettingLocale(this.code, this.name);

  factory SettingLocale.fromLocale(Locale locale) {
    var code = locale.toLanguageTag().replaceAll('-', '_');
    var name = LocaleNamesLocalizationsDelegate.nativeLocaleNames[code] ?? code;

    return SettingLocale(code, name);
  }
}

class SettingsGeneralFragment extends StatelessWidget {
  static final log = Logger('SettingsGeneralFragment');

  const SettingsGeneralFragment({Key? key}) : super(key: key);

  PrefDialog _createShareBaseDialog(BuildContext context) {
    var prefService = PrefService.of(context);
    var mediaQuery = MediaQuery.of(context);

    final controller = TextEditingController(text: prefService.get(optionShareBaseUrl));

    return PrefDialog(
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(L10n.of(context).cancel)),
          TextButton(
              onPressed: () async {
                await prefService.set(optionShareBaseUrl, controller.text);
                Navigator.pop(context);
              },
              child: Text(L10n.of(context).save))
        ],
        title: Text(L10n.of(context).share_base_url),
        children: [
          SizedBox(
            width: mediaQuery.size.width,
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'https://x.com'),
            ),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.current.general)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(children: [
          PrefDropdown(
              fullWidth: false,
              title: Text(L10n.current.language),
              subtitle: Text(L10n.current.language_subtitle),
              pref: optionLocale,
              items: [
                DropdownMenuItem(value: optionLocaleDefault, child: Text(L10n.current.system)),
                ...L10n.delegate.supportedLocales
                    .map((e) => SettingLocale.fromLocale(e))
                    .sorted((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()))
                    .map((e) => DropdownMenuItem(value: e.code, child: Text(e.name)))
              ]),
          if (getFlavor() != 'play' && getFlavor() != 'fdroid')
            PrefSwitch(
              title: Text(L10n.of(context).should_check_for_updates_label),
              pref: optionShouldCheckForUpdates,
              subtitle: Text(L10n.of(context).should_check_for_updates_description),
            ),
          PrefSwitch(
            title: Text(L10n.of(context).option_confirm_close_label),
            subtitle: Text(L10n.of(context).option_confirm_close_description),
            pref: optionConfirmClose,
          ),
          PrefDropdown(
              fullWidth: false,
              title: Text(L10n.of(context).default_tab),
              subtitle: Text(
                L10n.of(context).which_tab_is_shown_when_the_app_opens,
              ),
              pref: optionHomeInitialTab,
              items: defaultHomePages
                  .map((e) => DropdownMenuItem(value: e.id, child: Text(e.titleBuilder(context))))
                  .toList()),
          PrefDropdown(
              fullWidth: false,
              title: Text(L10n.of(context).default_subscription_tab),
              subtitle: Text(
                L10n.of(context).which_tab_is_shown_when_the_subscription_opens,
              ),
              pref: optionSubscriptionInitialTab,
              items: defaultSubscriptionTabs
                  .map((e) => DropdownMenuItem(value: e.id, child: Text(e.titleBuilder(context))))
                  .toList()),
          PrefSwitch(
            pref: optionTweetsHideSensitive,
            title: Text(L10n.of(context).hide_sensitive_tweets),
            subtitle: Text(L10n.of(context).whether_to_hide_tweets_marked_as_sensitive),
          ),
          PrefDialogButton(
            title: Text(L10n.of(context).share_base_url),
            subtitle: Text(L10n.of(context).share_base_url_description),
            dialog: _createShareBaseDialog(context),
          ),
          PrefSwitch(
            title: Text(L10n.of(context).disable_screenshots),
            subtitle: Text(L10n.of(context).disable_screenshots_hint),
            pref: optionDisableScreenshots,
          ),
          PrefSwitch(
            title: Text(L10n.of(context).activate_non_confirmation_bias_mode_label),
            pref: optionNonConfirmationBiasMode,
            subtitle: Text(L10n.of(context).activate_non_confirmation_bias_mode_description),
          ),
          ExpansionTile(
            title: Text(L10n.of(context).media),
            leading: const Icon(Icons.image),
            children: [
              PrefDropdown(
                  fullWidth: false,
                  title: Text(L10n.of(context).media_size),
                  subtitle: Text(
                    L10n.of(context).save_bandwidth_using_smaller_images,
                  ),
                  pref: optionMediaSize,
                  items: [
                    DropdownMenuItem(
                      value: 'disabled',
                      child: Text(L10n.of(context).disabled),
                    ),
                    DropdownMenuItem(
                      value: 'thumb',
                      child: Text(L10n.of(context).thumbnail),
                    ),
                    DropdownMenuItem(
                      value: 'small',
                      child: Text(L10n.of(context).small),
                    ),
                    DropdownMenuItem(
                      value: 'medium',
                      child: Text(L10n.of(context).medium),
                    ),
                    DropdownMenuItem(
                      value: 'large',
                      child: Text(L10n.of(context).large),
                    ),
                  ]),
              PrefSwitch(
                pref: optionMediaDefaultMute,
                title: Text(L10n.of(context).mute_videos),
                subtitle: Text(L10n.of(context).mute_video_description),
              ),
              const DownloadTypeSetting(),
              PrefSwitch(
                title: Text(L10n.of(context).download_video_best_quality_label),
                pref: optionDownloadBestVideoQuality,
                subtitle: Text(L10n.of(context).download_video_best_quality_description),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(L10n.of(context).feed),
            leading: const Icon(Icons.rss_feed),
            children: [
              PrefSwitch(
                title: Text(L10n.of(context).keep_feed_offset_label),
                subtitle: Text(L10n.of(context).keep_feed_offset_description),
                pref: optionKeepFeedOffset,
                onChange: (value) async {
                  if (!value) {
                    var repository = await Repository.writable();
                    await repository.delete(tableFeedGroupPositionState);
                  }
                },
              ),
              PrefSwitch(
                title: Text(L10n.of(context).leaner_feeds_label),
                subtitle: Text(L10n.of(context).leaner_feeds_description),
                pref: optionLeanerFeeds,
              ),
            ],
          ),
          ExpansionTile(
            title: Text(L10n.of(context).x_api),
            leading: const Icon(Icons.api_outlined),
            children: [
              PrefSwitch(
                title: Text(L10n.of(context).enhanced_feeds_label),
                subtitle: Text(L10n.of(context).enhanced_feeds_description),
                pref: optionEnhancedFeeds,
                onChange: (value) async {
                  var repository = await Repository.writable();
                  await repository.delete(tableFeedGroupChunk);
                  await repository.delete(tableFeedGroupPositionState);
                },
              ),
              PrefSwitch(
                title: Text(L10n.of(context).enhanced_searches_label),
                subtitle: Text(L10n.of(context).enhanced_searches_description),
                pref: optionEnhancedSearches,
              ),
              PrefSwitch(
                title: Text(L10n.of(context).enhanced_profile_label),
                subtitle: Text(L10n.of(context).enhanced_profile_description),
                pref: optionEnhancedProfile,
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class DownloadTypeSetting extends StatefulWidget {
  const DownloadTypeSetting({Key? key}) : super(key: key);

  @override
  DownloadTypeSettingState createState() => DownloadTypeSettingState();
}

class DownloadTypeSettingState extends State<DownloadTypeSetting> {
  @override
  Widget build(BuildContext context) {
    var downloadPath = PrefService.of(context).get<String>(optionDownloadPath) ?? '';

    return Column(
      children: [
        PrefDropdown(
          onChange: (value) {
            setState(() {});
          },
          fullWidth: false,
          title: Text(L10n.current.download_handling),
          subtitle: Text(L10n.current.download_handling_description),
          pref: optionDownloadType,
          items: [
            DropdownMenuItem(value: optionDownloadTypeAsk, child: Text(L10n.current.download_handling_type_ask)),
            DropdownMenuItem(
                value: optionDownloadTypeDirectory, child: Text(L10n.current.download_handling_type_directory)),
          ],
        ),
        if (PrefService.of(context).get(optionDownloadType) == optionDownloadTypeDirectory)
          PrefButton(
            onTap: () async {
              DeviceInfoPlugin plugin = DeviceInfoPlugin();
              AndroidDeviceInfo android = await plugin.androidInfo;
              var storagePermission = android.version.sdkInt < 30
                  ? await Permission.storage.request()
                  : await Permission.manageExternalStorage.request();
              if (storagePermission.isGranted) {
                String? directoryPath = await FilePicker.platform.getDirectoryPath();
                if (directoryPath == null) {
                  return;
                }

                // TODO: Gross. Figure out how to re-render automatically when the preference changes
                setState(() {
                  PrefService.of(context).set(optionDownloadPath, directoryPath);
                });
              } else if (storagePermission.isPermanentlyDenied) {
                await openAppSettings();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(L10n.current.permission_not_granted),
                    action: SnackBarAction(
                      label: L10n.current.open_app_settings,
                      onPressed: openAppSettings,
                    )));
              }
            },
            title: Text(L10n.current.download_path),
            subtitle: Text(
              downloadPath.isEmpty ? L10n.current.not_set : downloadPath,
            ),
            child: Text(L10n.current.choose),
          )
      ],
    );
  }
}
