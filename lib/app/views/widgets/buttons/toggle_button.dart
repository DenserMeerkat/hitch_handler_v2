import 'package:flutter/material.dart';

class IconToggleButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final IconData? selectedIcon;
  final bool isSelected;
  final Color? color;
  final Color? selectedColor;
  final double? borderRadius;
  final String? tooltip;
  final double? verticalOffset;
  const IconToggleButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.selectedIcon,
    required this.isSelected,
    this.color,
    this.selectedColor,
    this.borderRadius,
    this.tooltip,
    this.verticalOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? "Toggle",
      verticalOffset: verticalOffset ?? 30,
      child: IconButton(
        splashRadius: borderRadius ?? 30,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(
            isSelected ? selectedColor : color ?? Colors.transparent,
          ),
        ),
        isSelected: isSelected,
        onPressed: onPressed,
        selectedIcon: Icon(selectedIcon ?? icon),
        icon: Icon(icon),
      ),
    );
  }
}
