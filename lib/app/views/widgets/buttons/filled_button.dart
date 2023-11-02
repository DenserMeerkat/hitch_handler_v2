import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final Color? foreGroundColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final bool enabled;
  const CustomFilledButton({
    super.key,
    required this.label,
    this.foreGroundColor,
    this.backgroundColor,
    this.onPressed,
    this.padding,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        foregroundColor: foreGroundColor,
        backgroundColor: backgroundColor,
        minimumSize: const Size(50, 34),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: enabled ? (onPressed) : null,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
