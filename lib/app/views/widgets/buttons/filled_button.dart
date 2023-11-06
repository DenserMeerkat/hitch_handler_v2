import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? foreGroundColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final bool showIcon;
  final bool enabled;
  const CustomFilledButton({
    super.key,
    required this.label,
    this.icon = Icons.arrow_forward_rounded,
    this.foreGroundColor,
    this.backgroundColor,
    this.onPressed,
    this.padding,
    this.showIcon = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        foregroundColor: foreGroundColor,
        backgroundColor: backgroundColor,
        minimumSize: const Size(80, 40),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: enabled ? (onPressed) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) const Gap(4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
            ),
          ),
          if (showIcon) const Gap(8),
          if (showIcon)
            Icon(
              icon,
              size: 18,
            ),
        ],
      ),
    );
  }
}
