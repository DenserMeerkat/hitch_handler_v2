import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: getThemeModeName(value.selectedThemeMode) ==
                      label.toLowerCase()
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: getThemeModeName(value.selectedThemeMode) ==
                        label.toLowerCase()
                    ? FontWeight.w500
                    : FontWeight.normal,
                color: getThemeModeName(value.selectedThemeMode) ==
                        label.toLowerCase()
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            )
          ],
        ),
      ),
    );
  }
}
