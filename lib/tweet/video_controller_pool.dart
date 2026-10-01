import 'package:better_player_plus/better_player_plus.dart';
import 'package:squawker/tweet/video_quality.dart';

/// One cached video player: a [BetterPlayerController] together with the
/// resolved download URL and the selectable [qualities]. The pool owns this
/// controller and is the only thing allowed to dispose it (on LRU eviction) —
/// widgets attach/detach but never dispose. The
/// controller is created with `autoDispose: false`, so the [BetterPlayer]
/// widget's own teardown is a no-op and the player survives across screens.
class PooledVideo {
  final BetterPlayerController controller;
  final String? downloadUrl;
  final List<TweetVideoQuality> qualities;

  /// False for muted looping GIFs, which the single-audible-video policy leaves
  /// playing.
  final bool pausableByPolicy;

  bool _disposed = false;

  PooledVideo({
    required this.controller,
    required this.downloadUrl,
    required this.qualities,
    required this.pausableByPolicy,
  });

  bool get isPlaying => controller.isPlaying() ?? false;

  void pause() {
    if (isPlaying) controller.pause();
  }

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    // `autoDispose: false` on the config means only a forced dispose actually
    // releases the native player.
    controller.dispose(forceDispose: true);
  }
}

class _Entry {
  final Future<PooledVideo> future;
  PooledVideo? value;
  int refCount = 0;

  _Entry(this.future) {
    () async {
      try {
        value = await future;
      } catch (_) {}
    }();
  }

  void disposeWhenReady() {
    future.then((p) => p.dispose()).catchError((_) {});
  }
}

/// An LRU cache of video players, keyed by `tweetId:mediaIndex`.
///
/// Why this exists: navigating to a tweet (or scrolling back to it) used to build
/// a brand-new player and restart playback from zero. Keeping the player alive
/// lets the same video keep playing across screens and avoids re-fetching it. A
/// single instance is provided app-wide.
///
/// Lifetime contract:
///  - [acquire] returns the cached controller (creating it on a miss) and marks
///    it in use; concurrent callers for the same key share one player.
///  - [release] marks a widget as gone but does NOT dispose — the entry stays
///    cached for instant reuse.
///  - Only eviction disposes, and only entries with no live widget (refCount 0),
///    so a player on screen is never disposed from under its widget.
class VideoControllerPool {
  final int maxSize;
  final Map<String, _Entry> _entries = {};
  final Map<String, Set<Object>> _visibleTokens = {};
  VideoControllerPool({this.maxSize = 5});
  bool contains(String key) => _entries.containsKey(key);
  PooledVideo? peek(String key) => _entries[key]?.value;

  void markVisible(String key, Object token) {
    (_visibleTokens[key] ??= {}).add(token);
  }

  void markHidden(String key, Object token) {
    final tokens = _visibleTokens[key];
    if (tokens == null) return;
    tokens.remove(token);
    if (tokens.isEmpty) _visibleTokens.remove(key);
  }

  bool anyVisible(String key) => _visibleTokens[key]?.isNotEmpty ?? false;

  /// Pause every other policy-pausable player so only [active] is audible.
  void pauseOthers(PooledVideo active) {
    for (final entry in _entries.values) {
      final video = entry.value;
      if (video == null || identical(video, active)) continue;
      if (!video.pausableByPolicy) continue;
      video.pause();
    }
  }

  Future<PooledVideo> acquire(String key, Future<PooledVideo> Function() create) {
    var entry = _entries.remove(key) ?? _Entry(create());
    _entries[key] = entry;
    entry.refCount++;
    _evict();
    return entry.future;
  }

  void invalidate(String key) {
    final entry = _entries[key];
    if (entry == null) return;
    // Don't force-dispose a controller another widget still holds (the same video
    // live in two places): only drop and dispose it once no widget references it.
    // The caller releases its own ref before invalidating, so the common
    // single-holder case still disposes here.
    if (entry.refCount > 0) return;
    _entries.remove(key);
    _visibleTokens.remove(key);
    entry.disposeWhenReady();
  }

  void release(String key) {
    final entry = _entries[key];
    if (entry == null) return;
    if (entry.refCount > 0) entry.refCount--;
    _evict();
  }

  void _evict() {
    while (_entries.length > maxSize) {
      String? victimKey;
      for (final e in _entries.entries) {
        if (e.value.refCount == 0) {
          victimKey = e.key;
          break;
        }
      }
      if (victimKey == null) break;
      _entries.remove(victimKey)!.disposeWhenReady();
      _visibleTokens.remove(victimKey);
    }
  }
}
