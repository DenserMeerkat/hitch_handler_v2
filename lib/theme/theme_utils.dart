import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

bool isDark(BuildContext context) {
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}

class SystemOverlayWrapper extends StatelessWidget {
  final Widget child;
  const SystemOverlayWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle mySystemTheme = SystemUiOverlayStyle(
      systemNavigationBarColor: isDark(context) ? kBlack20 : kLBackgroundColor,
      systemNavigationBarIconBrightness:
          isDark(context) ? Brightness.light : Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: isDark(context) ? kBlack20 : kLBackgroundColor,
      statusBarBrightness: isDark(context) ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          isDark(context) ? Brightness.light : Brightness.dark,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: mySystemTheme,
      child: child,
    );
  }
}
