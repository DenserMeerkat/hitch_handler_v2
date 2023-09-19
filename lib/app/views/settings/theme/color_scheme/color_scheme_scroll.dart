import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/color_scheme/color_scheme_button.dart';
import 'package:hitch_handler_v2/theme/theme_provider.dart';
import 'package:hitch_handler_v2/theme/themes.dart';

class ColorSchemeScroll extends StatelessWidget {
  final ThemeProvider value;
  const ColorSchemeScroll({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 15.w,
          ),
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
            );
          }).toList(),
          SizedBox(
            width: 15.w - 6,
          ),
        ],
      ),
    );
  }
}
