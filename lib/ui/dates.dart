import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:squawker/locale_fallback/english.dart';
import 'package:timeago/timeago.dart' as timeago;

final absoluteDateFormat = DateFormat.yMMMd(dateLocaleFor(Intl.getCurrentLocale())).add_Hms();

String createRelativeDate(DateTime dateTime) {
  return timeago.format(dateTime, locale: Intl.shortLocale(Intl.getCurrentLocale()));
}

class Timestamp extends StatefulWidget {
  final DateTime? timestamp;

  const Timestamp({Key? key, required this.timestamp}) : super(key: key);

  @override
  State<Timestamp> createState() => _TimestampState();
}

class _TimestampState extends State<Timestamp> {
  bool _useRelativeTimestamp = true;

  String formattedTime = '';

  @override
  void initState() {
    super.initState();

    var timestamp = widget.timestamp;
    if (timestamp != null) {
      formattedTime = createRelativeDate(timestamp);
    }
  }

  @override
  Widget build(BuildContext context) {
    var timestamp = widget.timestamp;
    if (timestamp == null) {
      return Container();
    }

    return GestureDetector(
      child: Text(formattedTime),
      onTap: () {
        setState(() {
          if (_useRelativeTimestamp) {
            formattedTime = createRelativeDate(timestamp);
          } else {
            formattedTime = absoluteDateFormat.format(timestamp.toLocal());
          }

          _useRelativeTimestamp = !_useRelativeTimestamp;
        });
      },
    );
  }
}
