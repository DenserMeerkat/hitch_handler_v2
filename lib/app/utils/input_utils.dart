import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:tinycolor2/tinycolor2.dart';

const hiddenTextStyle = TextStyle(
  fontSize: 0.0,
  height: 0,
);

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

Container renderFieldBase(BuildContext context, Color shadowColor) {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      color: shadowColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
          offset: const Offset(0, 1.2),
        ),
      ],
    ),
  );
}

Container renderFieldIcon(BuildContext context, IconData? icon) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Container(
    height: 48,
    width: 48,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isDarkMode
          ? Theme.of(context).colorScheme.onTertiary
          : Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(8),
        right: Radius.circular(1),
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
          blurRadius: 1,
          offset: const Offset(2, 0),
        ),
      ],
    ),
    child: Icon(
      icon,
      color: isDarkMode
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.onPrimaryContainer,
      size: 20,
    ),
  );
}
