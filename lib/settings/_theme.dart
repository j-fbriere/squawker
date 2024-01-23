import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:squawker/utils/iterables.dart';
import 'package:pref/pref.dart';

class SettingsThemeFragment extends StatelessWidget {
  const SettingsThemeFragment({Key? key}) : super(key: key);

  int _getOptionTweetFontSizeValue(BuildContext context) {
    int optionTweetFontSizeValue =
        PrefService.of(context).get<int>(optionTweetFontSize) ?? Theme.of(context).textTheme.bodyMedium!.fontSize!.round();
    return optionTweetFontSizeValue;
  }

  void _createTweetFontSizeDialog(BuildContext context) async {
    int? selectedFontSize = await showDialog<int>(
      context: context,
      builder: (context) => FontSizePickerDialog(initialFontSize: _getOptionTweetFontSizeValue(context)),
    );
    if (selectedFontSize != null) {
      PrefService.of(context).set<int>(optionTweetFontSize, selectedFontSize);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.current.theme)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(children: [
          PrefDropdown(fullWidth: false, title: Text(L10n.of(context).theme_mode), pref: optionThemeMode, items: [
            DropdownMenuItem(
              value: 'system',
              child: Text(L10n.of(context).system),
            ),
            DropdownMenuItem(
              value: 'light',
              child: Text(L10n.of(context).light),
            ),
            DropdownMenuItem(
              value: 'dark',
              child: Text(L10n.of(context).dark),
            ),
          ]),
          PrefDropdown(
              title: Text(L10n.of(context).theme),
              fullWidth: false,
              pref: optionThemeColorScheme,
              items: FlexScheme.values
                  .getRange(0, FlexScheme.values.length - 1)
                  .sorted((a, b) => a.name.compareTo(b.name))
                  .map((scheme) => DropdownMenuItem(value: scheme.name, child: Text(scheme.name.capitalize)))
                  .toList()),
          PrefSwitch(
            title: Text(L10n.of(context).true_black),
            pref: optionThemeTrueBlack,
            subtitle: Text(
              L10n.of(context).use_true_black_for_the_dark_mode_theme,
            ),
          ),
          PrefSwitch(
            pref: optionThemeMaterial3,
            title: Row(children: [
              Text(
                L10n.of(context).material_3,
              ),
              Spacer(),
              Chip(label: Text(L10n.of(context).beta))
            ]),
          )
        ]),
      ),
    );
  }
}

class FontSizePickerDialog extends StatefulWidget {
  /// initial selection for the slider
  final int initialFontSize;

  const FontSizePickerDialog({Key? key, required this.initialFontSize}) : super(key: key);

  @override
  FontSizePickerDialogState createState() => FontSizePickerDialogState();
}

class FontSizePickerDialogState extends State<FontSizePickerDialog> {
  /// current selection of the slider
  late int tweetFontSize;

  @override
  void initState() {
    super.initState();
    tweetFontSize = widget.initialFontSize;
  }

  @override
  Widget build(BuildContext context) {
    double defaultFontSize = Theme.of(context).textTheme.bodyMedium!.fontSize!;
    double minFontSize = defaultFontSize - 4;
    double maxFontSize = defaultFontSize + 8;

    return AlertDialog(
      title: Text(L10n.of(context).tweet_font_size_label),
      content: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
        Text('$tweetFontSize px'),
        Slider(
          value: tweetFontSize.toDouble(),
          min: minFontSize,
          max: maxFontSize,
          divisions: ((maxFontSize - minFontSize) / 2).round(),
          label: '$tweetFontSize px',
          onChanged: (value) {
            setState(() {
              tweetFontSize = value.round();
            });
          },
        ),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(L10n.of(context).cancel)),
        TextButton(
            onPressed: () async {
              Navigator.pop(context, tweetFontSize);
            },
            child: Text(L10n.of(context).save))
      ],
    );
  }
}
