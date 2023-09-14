import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  final TextEditingController pinController;
  final FocusNode focusNode;
  const OtpField({
    super.key,
    required this.pinController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 58.h,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
      ),
    );
    return Container(
      width: 300.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isDarkMode ? kGrey30 : kLBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: isDarkMode ? kBlack20 : kGrey150,
          )
        ],
      ),
      child: Pinput(
        length: 6,
        controller: pinController,
        focusNode: focusNode,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        defaultPinTheme: defaultPinTheme,
        showCursor: true,
        separatorBuilder: (index) => Container(
          height: 58.w,
          width: 2.w,
          color: isDarkMode ? kGrey30 : kLBackgroundColor,
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.9),
        )),
      ),
    );
  }
}
