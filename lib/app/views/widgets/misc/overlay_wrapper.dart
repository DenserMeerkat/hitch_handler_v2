import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemOverlayWrapper extends StatelessWidget {
  final Widget child;
  const SystemOverlayWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle mySystemTheme =
        FlexColorScheme.themedSystemNavigationBar(
      context,
      opacity: 0,
      noAppBar: true,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: mySystemTheme,
      child: child,
    );
  }
}
