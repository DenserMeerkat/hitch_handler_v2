import 'package:flutter/material.dart';

class LongFilledButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? foreGroundColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  final bool enabled;
  const LongFilledButton({
    super.key,
    required this.label,
    this.icon = Icons.arrow_forward_rounded,
    this.foreGroundColor,
    this.backgroundColor,
    this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
          foregroundColor: foreGroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: enabled ? (onPressed) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
