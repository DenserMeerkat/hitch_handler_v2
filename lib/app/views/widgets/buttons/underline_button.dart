import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class UnderlineButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Color? color;
  final bool enabled;
  const UnderlineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color ?? Theme.of(context).colorScheme.tertiary,
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: enabled ? (onPressed ?? () {}) : null,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: isDark(context) ? FontWeight.normal : FontWeight.bold,
          letterSpacing: 0.8,
          color: Colors.transparent,
          shadows: [
            Shadow(
              color: Theme.of(context).colorScheme.tertiary,
              offset: const Offset(0, -4),
            )
          ],
          decoration: TextDecoration.underline,
          decorationColor: color ?? Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
