import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class UnderlineButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Color? color;
  final bool enabled;
  final TextDecorationStyle? decorationStyle;
  const UnderlineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
    this.enabled = true,
    this.decorationStyle = TextDecorationStyle.solid,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    Color? foreGroundColor = enabled
        ? color ?? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.outline;
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: foreGroundColor,
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: enabled ? (onPressed) : null,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: isDarkMode ? FontWeight.normal : FontWeight.bold,
          letterSpacing: 0.8,
          color: Colors.transparent,
          shadows: [
            Shadow(
              color: foreGroundColor,
              offset: const Offset(0, -4),
            )
          ],
          decoration: TextDecoration.underline,
          decorationStyle: decorationStyle,
          decorationColor: foreGroundColor,
        ),
      ),
    );
  }
}
