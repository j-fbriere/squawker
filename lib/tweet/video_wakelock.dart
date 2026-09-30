import 'package:wakelock_plus/wakelock_plus.dart';

class VideoWakelock {
  static final Set<Object> _holders = {};

  static void acquire(Object holder) {
    if (_holders.add(holder)) _apply();
  }

  static void release(Object holder) {
    if (_holders.remove(holder)) _apply();
  }

  static void reapply() => _apply();

  static void _apply() => WakelockPlus.toggle(enable: _holders.isNotEmpty);
}
