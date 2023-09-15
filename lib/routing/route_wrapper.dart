import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class SystemOverlayWrapper extends StatelessWidget {
  final Widget child;
  final Color navBarDarkColor;
  final Color navBarLightColor;
  final Color statusBarDarkColor;
  final Color statusBarLightColor;
  const SystemOverlayWrapper({
    super.key,
    required this.child,
    this.navBarDarkColor = kBlack20,
    this.navBarLightColor = kLBackgroundColor,
    this.statusBarDarkColor = kBlack20,
    this.statusBarLightColor = kLBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    SystemUiOverlayStyle mySystemTheme = SystemUiOverlayStyle(
      systemNavigationBarColor: isDarkMode ? navBarDarkColor : navBarLightColor,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: isDarkMode ? statusBarDarkColor : statusBarLightColor,
      statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: mySystemTheme,
      child: child,
    );
  }
}
