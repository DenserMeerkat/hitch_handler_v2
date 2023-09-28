import 'package:flutter/material.dart';

PreferredSize bottomLine(BuildContext context, {Color? color}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(1.0),
    child: Container(
      height: 1,
      color: color ?? (Theme.of(context).colorScheme.outlineVariant),
    ),
  );
}
