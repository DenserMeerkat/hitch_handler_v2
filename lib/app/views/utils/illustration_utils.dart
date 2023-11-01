import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:tinycolor2/tinycolor2.dart';

Future<String> loadAndModifySvg(
    IllustrationType illustration, String colorHex, bool isDark) async {
  late dynamic svgContent;
  try {
    svgContent = await rootBundle.loadString(illustration.pathName);
  } on Exception catch (e) {
    debugPrint('Could not load asset image! : ${e.toString()}');
    svgContent = await rootBundle
        .loadString("assets/svg/illustrations/undraw_blank_canvas.svg");
  }
  // Replace the specific color '#6c63ff' with the provided 'colorHex'
  final modifiedSvgContent = svgContent.replaceAll('#6c63ff', colorHex);

  final RegExp colorRegExp = RegExp(
      r'fill="#[0-9A-Fa-f]{3,6}"'); // Matches fill attributes with 3 to 6 character hex color codes

  final processedSvgContent = modifiedSvgContent.replaceAllMapped(
    colorRegExp,
    (Match match) {
      final String colorCode = match.group(0)!; // Get the matched color code

      // Determine if the color is a shade of gray (RR, GG, and BB components are equal)
      final bool isGrayColor =
          colorCode.length == 11 // Check if it's a #RRGGBB color code
              ? colorCode[7] == colorCode[8] && colorCode[8] == colorCode[9]
              : colorCode.length == 14 && // Check if it's a #RGB color code
                  colorCode[7] == colorCode[9] &&
                  colorCode[9] == colorCode[11] &&
                  colorCode[8] == colorCode[10] &&
                  colorCode[10] == colorCode[12];
      final String color = colorCode.length == 14
          ? colorCode.substring(7, 13)
          : colorCode.substring(7, 10);

      if (isGrayColor) {
        // Replace gray color with dark or light color based on isDarkMode
        final String newColor = isDark
            ? toHex(TinyColor.fromString('#$color')
                .darken(illustration.darkenValue)
                .mix(
                    illustration.mixColor ??
                        TinyColor.fromString(colorHex).toColor(),
                    illustration.mixValue)
                .toHex8())
            : toHex(TinyColor.fromString('#$color')
                .darken(illustration.lightDarkenValue)
                .mix(
                    illustration.lightMixColor ??
                        TinyColor.fromString(colorHex).toColor(),
                    illustration.lightMixValue)
                .toHex8());
        return 'fill="$newColor"';
      } else {
        // Preserve non-gray colors
        return colorCode;
      }
    },
  );

  return processedSvgContent;
}

String toHex(String color) {
  String hexColor =
      color.length == 8 ? color.substring(2, 8) : color.substring(2, 8);
  return '#$hexColor';
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).substring(2)}';
}
