import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setSystemOverlay(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Theme.of(context).colorScheme.surface,
      systemNavigationBarIconBrightness:
          Theme.of(context).colorScheme.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      systemNavigationBarDividerColor: Theme.of(context).colorScheme.surface,
      statusBarColor: Theme.of(context).colorScheme.surface,
      statusBarBrightness:
          Theme.of(context).colorScheme.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      statusBarIconBrightness:
          Theme.of(context).colorScheme.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

bool isDark(BuildContext context) {
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}
