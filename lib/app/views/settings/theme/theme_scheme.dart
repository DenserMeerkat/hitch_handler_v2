import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:hitch_handler_v2/theme/themes.dart';

class ThemeScheme extends StatelessWidget {
  const ThemeScheme({
    super.key,
    required this.flexScheme,
  });

  final FlexScheme flexScheme;

  @override
  Widget build(BuildContext context) {
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
                ? getTheme(flexScheme, isDark(context)).colorScheme.primary
                : getTheme(flexScheme, isDark(context)).colorScheme.primary,
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
            color: getTheme(flexScheme, isDark(context))
                .colorScheme
                .scrim
                .withOpacity(0.2),
          ),
          Row(
            children: [
              Container(
                height: 23,
                width: 23,
                color: isDark(context)
                    ? getTheme(flexScheme, isDark(context))
                        .colorScheme
                        .secondary
                    : getTheme(flexScheme, isDark(context))
                        .colorScheme
                        .secondaryContainer,
              ),
              Container(
                width: 0.5,
                height: 23,
                color: getTheme(flexScheme, isDark(context))
                    .colorScheme
                    .scrim
                    .withOpacity(0.2),
              ),
              Container(
                height: 23,
                width: 24,
                color: isDark(context)
                    ? getTheme(flexScheme, isDark(context)).colorScheme.tertiary
                    : getTheme(flexScheme, isDark(context))
                        .colorScheme
                        .tertiaryContainer,
              ),
            ],
          )
        ],
      ),
    );
  }
}
