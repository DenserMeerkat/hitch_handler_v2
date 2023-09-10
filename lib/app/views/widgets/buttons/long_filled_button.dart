import 'package:flutter/material.dart';

class LongFilledButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? foreGroundColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  const LongFilledButton({
    super.key,
    required this.label,
    required this.icon,
    this.foreGroundColor,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        foregroundColor: foreGroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 380,
        ),
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
