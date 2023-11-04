import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/home/feed/filter_sheet.dart';
import 'package:hitch_handler_v2/theme/color_enum.dart';

class FilterChipW extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorEnum colorEnum;
  final Color? borderColor;
  const FilterChipW({
    super.key,
    required this.icon,
    required this.label,
    this.colorEnum = ColorEnum.secondary,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    ColorFamily colorFamily = getColorFamily(colorEnum, context);
    return GestureDetector(
      onTap: () {
        showFilterSheet(context);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
        decoration: BoxDecoration(
          color: (colorFamily.colorContainer).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colorFamily.color,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 12,
            ),
            const Gap(4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
