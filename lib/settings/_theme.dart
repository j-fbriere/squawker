import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:pref/pref.dart';

class SettingsThemeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsThemeFragmentState();
}

class SettingsThemeFragmentState extends State<SettingsThemeFragment> {
  int _getOptionTweetFontSizeValue(BuildContext context) {
    int optionTweetFontSizeValue =
        PrefService.of(context).get<int>(optionTweetFontSize) ?? DefaultTextStyle.of(context).style.fontSize!.round();
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
    BasePrefService prefs = PrefService.of(context);

    dynamic prefColor = prefs.get(optionThemeColorScheme);
    Color color = colorFromHex(prefColor) ?? Colors.yellow;

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
          PrefButton(
            title: Text(L10n.of(context).theme),
            child: Icon(Icons.palette_rounded, color: color),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    var selectedColor = color;

                    return AlertDialog(
                      title: Text(L10n.of(context).pick_a_color),
                      content: SingleChildScrollView(
                        child: MaterialPicker(
                          pickerColor: color,
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
                              prefs.set(optionThemeColorScheme, colorToHex(color).toString());
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
          PrefSwitch(
            title: Text(L10n.of(context).true_black),
            pref: optionThemeTrueBlack,
            subtitle: Text(
              L10n.of(context).use_true_black_for_the_dark_mode_theme,
            ),
          ),
          PrefButton(
            title: Text(L10n.of(context).tweet_font_size_label),
            subtitle: Text(L10n.of(context).tweet_font_size_description),
            onTap: () => _createTweetFontSizeDialog(context),
            child: Text('${_getOptionTweetFontSizeValue(context)} px'),
          ),
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
    double defaultFontSize = DefaultTextStyle.of(context).style.fontSize!;
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
