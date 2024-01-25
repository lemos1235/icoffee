//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/29
//
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class GFFeedback {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  GFFeedback._();

  /// Provides platform-specific feedback for a tap.
  ///
  /// On Android the click system sound is played. On iOS this is a no-op.
  ///
  /// See also:
  ///
  ///  * [wrapForTap] to trigger platform-specific feedback before executing a
  ///    [GestureTapCallback].
  static Future<void> forTap(BuildContext context) async {
    context.findRenderObject()!.sendSemanticsEvent(const TapSemanticEvent());
    switch (_platform(context)) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return SystemSound.play(SystemSoundType.click);
      case TargetPlatform.iOS:
        return HapticFeedback.mediumImpact();
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return Future<void>.value();
    }
  }

  /// Wraps a [GestureTapCallback] to provide platform specific feedback for a
  /// tap before the provided callback is executed.
  ///
  /// On Android the platform-typical click system sound is played. On iOS this
  /// is a no-op as that platform usually doesn't provide feedback for a tap.
  ///
  /// See also:
  ///
  ///  * [forTap] to just trigger the platform-specific feedback without wrapping
  ///    a [GestureTapCallback].
  static GestureTapCallback? wrapForTap(GestureTapCallback? callback, BuildContext context) {
    if (callback == null) return null;
    return () {
      GFFeedback.forTap(context);
      callback();
    };
  }

  /// Provides platform-specific feedback for a long press.
  ///
  /// On Android the platform-typical vibration is triggered. On iOS this is a
  /// no-op as that platform usually doesn't provide feedback for long presses.
  ///
  /// See also:
  ///
  ///  * [wrapForLongPress] to trigger platform-specific feedback before
  ///    executing a [GestureLongPressCallback].
  static Future<void> forLongPress(BuildContext context) {
    context.findRenderObject()!.sendSemanticsEvent(const LongPressSemanticsEvent());
    switch (_platform(context)) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return HapticFeedback.vibrate();
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return Future<void>.value();
    }
  }

  /// Wraps a [GestureLongPressCallback] to provide platform specific feedback
  /// for a long press before the provided callback is executed.
  ///
  /// On Android the platform-typical vibration is triggered. On iOS this
  /// is a no-op as that platform usually doesn't provide feedback for a long
  /// press.
  ///
  /// See also:
  ///
  ///  * [forLongPress] to just trigger the platform-specific feedback without
  ///    wrapping a [GestureLongPressCallback].
  static GestureLongPressCallback? wrapForLongPress(
      GestureLongPressCallback? callback, BuildContext context) {
    if (callback == null) return null;
    return () {
      Feedback.forLongPress(context);
      callback();
    };
  }

  static TargetPlatform _platform(BuildContext context) => Theme.of(context).platform;
}
