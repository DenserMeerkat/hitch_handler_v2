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
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: colorFamily.colorContainer.withOpacity(isDarkMode ? 0.5 : 0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorFamily.color,
            width: 0.1,
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: colorFamily.onColorContainer,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
