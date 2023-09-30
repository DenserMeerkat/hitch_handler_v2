import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';

class ColorSchemeButton extends StatelessWidget {
  final FlexScheme flexScheme;
  final Function() onPressed;
  final bool isActive;
  final double rightMargin;
  final double tooltipVerticalOffset;
  final double size;
  final double padding;
  final double borderRadius;
  const ColorSchemeButton({
    super.key,
    required this.flexScheme,
    required this.onPressed,
    required this.rightMargin,
    required this.tooltipVerticalOffset,
    required this.size,
    required this.padding,
    required this.borderRadius,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: flexScheme.name,
      verticalOffset: tooltipVerticalOffset,
      preferBelow: true,
      child: Container(
        padding: EdgeInsets.only(right: rightMargin),
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: isActive
                ? getTheme(flexScheme, isDark(context), 40, 12)
                    .colorScheme
                    .surfaceVariant
                : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            padding: EdgeInsets.all(padding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .outlineVariant
                    .withOpacity(0.4),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ColorSchemePreview(
                flexScheme: flexScheme,
                size: size,
              ),
              isActive
                  ? TickMark(
                      flexScheme: flexScheme,
                      size: size,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class TickMark extends StatelessWidget {
  final double size;
  const TickMark({
    super.key,
    required this.flexScheme,
    required this.size,
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
        size: size * 0.4,
        color: getTheme(flexScheme, isDark(context), 40, 12)
            .colorScheme
            .onPrimaryContainer,
      ),
    );
  }
}
