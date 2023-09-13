import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

PreferredSize bottomLine(BuildContext context, {Color? color}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(1.0),
    child: Container(
      height: 1.5,
      color: color ??
          (isDark(context)
              ? Theme.of(context).colorScheme.surfaceVariant
              : kLBlack20),
    ),
  );
}
