import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;
  const AppWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        backgroundColor: isDarkMode ? kBlack20 : kLBackgroundColor,
        title: Text(
          appName.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: child,
    );
  }
}
