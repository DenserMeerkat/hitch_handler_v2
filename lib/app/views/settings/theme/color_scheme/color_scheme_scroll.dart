import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme_button.dart';
import 'package:hitch_handler_v2/providers/theme_provider.dart';
import 'package:hitch_handler_v2/theme/themes.dart';

class ColorSchemeScroll extends StatelessWidget {
  final ThemeProvider value;
  final double size;
  final double horizontalPadding;
  final double rightMargin;
  final double tooltipVerticalOffset;
  final double padding;
  final double borderRadius;
  const ColorSchemeScroll({
    super.key,
    required this.value,
    this.size = 50,
    this.horizontalPadding = 15,
    this.rightMargin = 6,
    this.tooltipVerticalOffset = 38,
    this.padding = 12,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(horizontalPadding.w),
          ...colorSchemes.entries.map((entry) {
            final schemeName = entry.key;
            final flexScheme = entry.value;

            return ColorSchemeButton(
              key: ValueKey(schemeName),
              flexScheme: flexScheme,
              isActive: value.selectedColorScheme == flexScheme,
              onPressed: () {
                value.updateSelectedColorScheme(flexScheme);
              },
              rightMargin: rightMargin,
              tooltipVerticalOffset: tooltipVerticalOffset,
              size: size,
              padding: padding,
              borderRadius: borderRadius,
            );
          }).toList(),
          Gap(horizontalPadding.w - rightMargin.w),
        ],
      ),
    );
  }
}
