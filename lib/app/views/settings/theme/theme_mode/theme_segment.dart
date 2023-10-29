import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:provider/provider.dart';

class ThemeSegment extends StatelessWidget {
  final IconData iconData;
  final String label;
  final int position;
  const ThemeSegment({
    super.key,
    required this.iconData,
    required this.label,
    this.position = 1,
  });
  @override
  Widget build(BuildContext context) {
    ThemeProvider value = context.read<ThemeProvider>();
    final bool isActive =
        getThemeModeName(value.selectedThemeMode) == label.toLowerCase();
    return Expanded(
      child: GestureDetector(
        onTap: () {
          value.updateSelectedThemeMode(getThemeMode(label.toLowerCase()));
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).canvasColor,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(position == 0 ? 10 : 0),
                right: Radius.circular(position == 2 ? 10 : 0),
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: isActive
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                  color: isActive
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
