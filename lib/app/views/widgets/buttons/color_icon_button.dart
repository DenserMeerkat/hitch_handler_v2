import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/color_enum.dart';

class ColorIconButton extends StatelessWidget {
  final String? tooltip;
  final Function()? onTap;
  final IconData icon;
  final ColorEnum color;
  const ColorIconButton({
    super.key,
    this.tooltip,
    this.onTap,
    required this.icon,
    this.color = ColorEnum.tertiary,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final ColorFamily colorFamily = getColorFamily(color, context);
    return Tooltip(
      message: tooltip,
      child: IconButton(
        splashRadius: 8,
        style: IconButton.styleFrom(
          backgroundColor:
              colorFamily.colorContainer.withOpacity(isDarkMode ? 0.5 : 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: colorFamily.color.withOpacity(0.2),
            width: 1,
          ),
        ),
        onPressed: onTap,
        icon: Icon(
          icon,
          color: colorFamily.onColorContainer,
          size: 18,
        ),
      ),
    );
  }
}
