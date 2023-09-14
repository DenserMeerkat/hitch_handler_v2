import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class CircularCountDown extends StatelessWidget {
  final CountDownController countDownController;
  final bool isCounting;
  final Function(bool) onCounterChange;
  final int duration;
  const CircularCountDown({
    super.key,
    required this.countDownController,
    required this.isCounting,
    required this.onCounterChange,
    this.duration = otpCountdownTime,
  });
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return CircularCountDownTimer(
      duration: duration,
      initialDuration: 0,
      controller: countDownController,
      width: 30,
      height: 30,
      ringColor: isDarkMode ? kGrey40 : kLGrey30,
      ringGradient: null,
      fillColor: Theme.of(context).colorScheme.tertiary,
      fillGradient: null,
      backgroundColor: Colors.transparent,
      backgroundGradient: null,
      strokeWidth: 3,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 8.0,
          color: isDarkMode ? kTextColor : kLTextColor,
          fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        if (!isCounting) {
          onCounterChange(true);
        }
      },
      onComplete: () {
        onCounterChange(false);
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "0";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
