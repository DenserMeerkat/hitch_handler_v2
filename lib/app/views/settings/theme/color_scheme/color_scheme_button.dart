import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';

class ColorSchemeButton extends StatelessWidget {
  final FlexScheme flexScheme;
  final Function() onPressed;
  final bool isActive;
  const ColorSchemeButton({
    super.key,
    required this.flexScheme,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: flexScheme.name,
      verticalOffset: 38,
      preferBelow: true,
      child: Container(
        padding: const EdgeInsets.only(right: 6),
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: isActive
                ? getTheme(flexScheme, isDark(context), 40, 12)
                    .colorScheme
                    .surfaceVariant
                : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .outlineVariant
                      .withOpacity(0.4),
                )),
          ),
          onPressed: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ColorSchemePreview(flexScheme: flexScheme),
              isActive ? TickMark(flexScheme: flexScheme) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class TickMark extends StatelessWidget {
  const TickMark({
    super.key,
    required this.flexScheme,
  });

  final FlexScheme flexScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: getTheme(flexScheme, isDark(context), 40, 12)
            .colorScheme
            .primaryContainer,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        Icons.check_rounded,
        size: 20,
        color: getTheme(flexScheme, isDark(context), 40, 12)
            .colorScheme
            .onPrimaryContainer,
      ),
    );
  }
}
