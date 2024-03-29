import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const PageTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 180, maxHeight: 40),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: isDark(context)
              ? Theme.of(context).colorScheme.onTertiary.withOpacity(0.8)
              : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: isDarkMode ? kBlack10 : kLGrey30,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isDarkMode
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            Gap(15.w),
            Text(
              title,
              style: TextStyle(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
