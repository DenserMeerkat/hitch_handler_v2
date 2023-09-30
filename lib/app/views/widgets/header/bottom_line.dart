import 'package:flutter/material.dart';

PreferredSize bottomLine(BuildContext context,
    {Color? color, double height = 1}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Container(
      height: 1,
      color: color ?? (Theme.of(context).colorScheme.outlineVariant),
    ),
  );
}
