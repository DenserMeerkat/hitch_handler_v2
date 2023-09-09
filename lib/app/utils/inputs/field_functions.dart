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

Widget obscureButton(bool obscure, Function() onTap, Color? color) {
  return IconButton(
    onPressed: onTap,
    icon: obscure
        ? Icon(
            Icons.visibility_rounded,
            color: color,
            size: 16,
          )
        : Icon(
            Icons.visibility_off_rounded,
            color: color,
            size: 16,
          ),
  );
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
