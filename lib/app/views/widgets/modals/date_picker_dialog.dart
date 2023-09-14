import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

Future<DateTime?> showCustomDatePicker(
    BuildContext context, DateTime initialDate) {
  final bool isDarkMode = isDark(context);
  DateTime now = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(now.year - 18, now.month, now.day),
    builder: (context, child) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 5.w),
        child: Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: isDarkMode
                  ? kBlack20
                  : Theme.of(context).colorScheme.primaryContainer,
              backgroundColor: isDarkMode ? kGrey30 : null,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              dayStyle: const TextStyle(
                fontSize: 11,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          child: child!,
        ),
      );
    },
  );
}
