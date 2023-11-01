import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';
import 'package:tinycolor2/tinycolor2.dart';

class ColorSchemePreview extends StatelessWidget {
  final double size;
  const ColorSchemePreview({
    super.key,
    required this.flexScheme,
    this.size = 50,
  });

  final FlexScheme flexScheme;

  @override
  Widget build(BuildContext context) {
    final ThemeData schemeTheme = getTheme(flexScheme, isDark(context), 40, 12);
    return Container(
      width: size * 0.96,
      height: size * 0.96,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size * 0.49,
            color: isDark(context)
                ? schemeTheme.colorScheme.primary
                    .mix(schemeTheme.colorScheme.primaryContainer, 30)
                : schemeTheme.colorScheme.primary
                    .mix(schemeTheme.colorScheme.primaryContainer, 20),
          ),
          Divider(
            height: size * 0.01,
            thickness: size * 0.01,
            color: schemeTheme.colorScheme.scrim,
          ),
          Row(
            children: [
              Container(
                height: size * 0.46,
                width: size * 0.46,
                color: isDark(context)
                    ? schemeTheme.colorScheme.secondary
                    : schemeTheme.colorScheme.secondaryContainer
                        .mix(schemeTheme.colorScheme.secondary, 10),
              ),
              Container(
                width: size * 0.01,
                height: size * 0.46,
                color: schemeTheme.colorScheme.scrim,
              ),
              Container(
                height: size * 0.46,
                width: size * 0.48,
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
