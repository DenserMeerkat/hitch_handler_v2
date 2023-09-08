import 'package:flutter/material.dart';

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

Widget suffixIcon(IconData icon) {
  return Icon(
    icon,
    size: 16,
  );
}

Widget multiFieldButton(IconData icon, Function() onTap) {
  return IconButton(
    onPressed: onTap,
    icon: Icon(
      icon,
      size: 16,
    ),
  );
}

Widget obscureButton(bool obscure, Function() onTap) {
  return IconButton(
    onPressed: onTap,
    icon: obscure
        ? const Icon(
            Icons.visibility_rounded,
            size: 16,
          )
        : const Icon(
            Icons.visibility_off_rounded,
            size: 16,
          ),
  );
}

OutlineInputBorder inputBorder(String type, BuildContext context,
    {double? width, double radius = 8, Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      width: width ?? getBorderWidth(type),
      color: color ?? getBorderColor(type, context),
    ),
  );
}

double getBorderWidth(String type) {
  switch (type) {
    case "focused":
      return 2;
    case "focusedError":
      return 2;
    default:
      return 1;
  }
}

Color getBorderColor(String type, BuildContext context) {
  switch (type) {
    case "border":
      return Theme.of(context).colorScheme.surfaceVariant;
    case "error":
      return Theme.of(context).colorScheme.error;
    case "disabled":
      return Theme.of(context).colorScheme.onSurface;
    case "enabled":
      return Theme.of(context).colorScheme.primary.withOpacity(0.4);
    case "focused":
      return Theme.of(context).colorScheme.primary.withOpacity(0.6);
    case "focusedError":
      return Theme.of(context).colorScheme.error;
    default:
      return Theme.of(context).colorScheme.primary;
  }
}
