import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;
  final bool showTitle;
  final double toolbarHeight;
  const AppWrapper({
    super.key,
    required this.child,
    this.showTitle = true,
    this.toolbarHeight = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: toolbarHeight,
        title: showTitle
            ? Text(
                appName.toUpperCase(),
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              )
            : null,
        centerTitle: true,
      ),
      body: child,
    );
  }
}
