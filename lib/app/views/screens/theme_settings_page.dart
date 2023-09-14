import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Map<int, Widget> children;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    children = {
      0: const ThemeSegment(
        iconData: Icons.smartphone_outlined,
        label: "System",
      ),
      1: const ThemeSegment(
        iconData: Icons.light_mode_outlined,
        label: "Light",
      ),
      2: const ThemeSegment(
        iconData: Icons.dark_mode_outlined,
        label: "Dark",
      ),
    };
    return Scaffold(
      backgroundColor: isDarkMode ? kGrey30 : kLBlack10,
      appBar: AppBar(
        backgroundColor: isDarkMode ? kBlack20 : kLBackgroundColor,
        title: const Text(
          "Theme Settings",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: LeadingWidget(
          onPressed: () => context.pop(),
        ),
        bottom: bottomLine(context),
        toolbarHeight: kToolbarHeight,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            MaterialSegmentedControl(
              children: children,
              selectionIndex: getThemeIndex(getCurrentTheme(context)),
              borderColor: isDarkMode
                  ? Theme.of(context)
                      .colorScheme
                      .outlineVariant
                      .withOpacity(0.5)
                  : Theme.of(context).colorScheme.outlineVariant,
              selectedColor: isDarkMode
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
                  : Theme.of(context).colorScheme.primaryContainer,
              unselectedColor: isDarkMode ? kBlack20 : kLBackgroundColor,
              selectedTextStyle: TextStyle(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w500,
              ),
              unselectedTextStyle: TextStyle(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primaryContainer,
              ),
              borderWidth: 1.2,
              borderRadius: 10.0,
              horizontalPadding: EdgeInsets.zero,
              onSegmentTapped: (index) {
                if (!mounted) return;
                if (index == 0) {
                  AdaptiveTheme.of(context).setSystem();
                } else if (index == 1) {
                  AdaptiveTheme.of(context).setLight();
                } else {
                  AdaptiveTheme.of(context).setDark();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeSegment extends StatelessWidget {
  final IconData iconData;
  final String label;
  const ThemeSegment({
    super.key,
    required this.iconData,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: getCurrentTheme(context) == label.toLowerCase()
                ? isDarkMode
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.primary
                : isDarkMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            label,
            style: TextStyle(
              color: getCurrentTheme(context) == label.toLowerCase()
                  ? isDarkMode
                      ? Theme.of(context).colorScheme.onSecondary
                      : Theme.of(context).colorScheme.primary
                  : isDarkMode
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          )
        ],
      ),
    );
  }
}
