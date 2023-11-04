import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:gap/gap.dart';

class AuthPageTitle extends StatelessWidget {
  final TabController tabController;
  AuthPageTitle({super.key, required this.tabController});
  final List<AuthTabType> tabs = authTabs;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return Container(
        constraints: const BoxConstraints(maxWidth: 140, maxHeight: 40),
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
          ],
        ),
        child: tabController.index == 0
            ? renderTab(
                context,
                tabs[0].title,
                tabs[0].icon,
              )
            : renderTab(
                context,
                tabs[1].title,
                tabs[1].icon,
              ));
  }

  Widget renderTab(BuildContext context, String title, IconData icon) {
    final bool isDarkMode = isDark(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
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
