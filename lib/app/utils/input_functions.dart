import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:tinycolor2/tinycolor2.dart';

Widget clearButton(TextEditingController controller) {
  return GestureDetector(
    onTap: () {
      controller.clear();
    },
    child: const Icon(
      Icons.clear,
      size: 16,
    ),
  );
}

Widget suffixIcon(IconData icon, Color? color) {
  return Icon(
    icon,
    color: color,
    size: 16,
  );
}

Widget multiFieldButton(IconData icon, Function() onTap, Color? color) {
  return IconButton(
    onPressed: onTap,
    icon: Icon(
      icon,
      color: color,
      size: 16,
    ),
  );
}

Widget suffixButton(Function() onTap, IconData icon, Color? color) {
  return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: color,
        size: 16,
      ));
}

Widget obscureButton(bool obscure, Function() onTap, Color? color) {
  return IconButton(
    onPressed: onTap,
    icon: obscure
        ? Icon(
            Icons.visibility_outlined,
            color: color,
            size: 16,
          )
        : Icon(
            Icons.visibility_off_outlined,
            color: color,
            size: 16,
          ),
  );
}

Color getStrengthColor(BuildContext context, double strength) {
  if (strength < 0.3) {
    return isDark(context)
        ? Theme.of(context)
            .colorScheme
            .errorContainer
            .mix(Theme.of(context).colorScheme.error, 50)
        : Theme.of(context).colorScheme.error;
  } else if (strength < 0.6) {
    return Theme.of(context).colorScheme.tertiary;
  } else {
    return Theme.of(context).colorScheme.primary;
  }
}

OutlineInputBorder inputBorder(String type, BuildContext context,
    {double? width, double radius = 8, Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      width: width ?? 0,
      color: color ?? Colors.transparent,
    ),
  );
}
