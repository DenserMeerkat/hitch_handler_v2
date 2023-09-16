import 'package:flex_color_scheme/flex_color_scheme.dart';
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
    SystemUiOverlayStyle mySystemTheme =
        FlexColorScheme.themedSystemNavigationBar(context, opacity: 0);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: mySystemTheme,
      child: child,
    );
  }
}
