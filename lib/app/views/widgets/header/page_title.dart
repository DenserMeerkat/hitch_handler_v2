import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const PageTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 30, 8).r,
      decoration: BoxDecoration(
          color: isDark(context)
              ? kBackgroundColor
              : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: isDark(context) ? kBlack10 : kLGrey30,
            )
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isDark(context)
                ? kTextColor
                : Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          SizedBox(width: 15.w),
          Text(
            title,
            style: TextStyle(
              color: isDark(context)
                  ? kTextColor
                  : Theme.of(context).colorScheme.onSecondaryContainer,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
