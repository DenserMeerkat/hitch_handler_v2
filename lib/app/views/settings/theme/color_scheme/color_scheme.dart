import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:tinycolor2/tinycolor2.dart';

class ColorSchemePreview extends StatelessWidget {
  const ColorSchemePreview({
    super.key,
    required this.flexScheme,
  });

  final FlexScheme flexScheme;

  @override
  Widget build(BuildContext context) {
    final ThemeData schemeTheme = getTheme(flexScheme, isDark(context), 40, 12);
    return Container(
      width: 48,
      height: 48,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 24.5,
            color: isDark(context)
                ? schemeTheme.colorScheme.primary
                    .mix(schemeTheme.colorScheme.primaryContainer, 30)
                : schemeTheme.colorScheme.primary
                    .mix(schemeTheme.colorScheme.primaryContainer, 20),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            color: schemeTheme.colorScheme.scrim,
          ),
          Row(
            children: [
              Container(
                height: 23,
                width: 23,
                color: isDark(context)
                    ? schemeTheme.colorScheme.secondary
                    : schemeTheme.colorScheme.secondaryContainer
                        .mix(schemeTheme.colorScheme.secondary, 10),
              ),
              Container(
                width: 0.5,
                height: 23,
                color: schemeTheme.colorScheme.scrim,
              ),
              Container(
                height: 23,
                width: 24,
                color: isDark(context)
                    ? schemeTheme.colorScheme.tertiary
                    : schemeTheme.colorScheme.tertiary
                        .mix(schemeTheme.colorScheme.tertiaryContainer, 60),
              ),
            ],
          )
        ],
      ),
    );
  }
}