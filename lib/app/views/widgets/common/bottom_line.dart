import 'package:flutter/material.dart';

PreferredSize bottomLine(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(1.0),
    child: Container(
      height: 1.5,
      color: Theme.of(context).colorScheme.surfaceVariant,
    ),
  );
}
