import 'package:flutter/material.dart';
import 'package:squawker/constants.dart';
import 'package:squawker/generated/l10n.dart';
import 'package:pref/pref.dart';

class SettingsPostThemeFragment extends StatelessWidget {
  const SettingsPostThemeFragment({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).post_theme)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(children: [
          PrefSwitch(
            pref: optionAvatarSquare,
            title: Text(L10n.of(context).square_avatar),
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

    if (tweetFontSize < minFontSize || tweetFontSize > maxFontSize) {
      setState(() {
        tweetFontSize = defaultFontSize.round();
      });
    }

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
