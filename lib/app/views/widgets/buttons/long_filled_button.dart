import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LongFilledButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? foreGroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
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
    this.borderColor,
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
          minimumSize: const Size(40, 40),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1,
          ),
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
            const Gap(8),
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
