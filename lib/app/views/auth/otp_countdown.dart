import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/underline_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/circular_countdown.dart';

class OtpCountdown extends StatefulWidget {
  final Function()? resendFunction;
  const OtpCountdown({
    super.key,
    this.resendFunction,
  });

  @override
  State<OtpCountdown> createState() => _OtpCountdownState();
}

class _OtpCountdownState extends State<OtpCountdown> {
  final countDownController = CountDownController();
  bool isLoading = false;
  bool isCounting = true;

  void onCounterChange(bool isCounting) {
    if (!mounted) return;
    setState(() {
      this.isCounting = isCounting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UnderlineButton(
          enabled: !isCounting,
          onPressed: () {
            countDownController.restart();
          },
          label: "Resend Code",
          decorationStyle: TextDecorationStyle.dashed,
        ),
        const Gap(10),
        CircularCountDown(
          countDownController: countDownController,
          isCounting: isCounting,
          onCounterChange: onCounterChange,
        )
      ],
    );
  }
}
