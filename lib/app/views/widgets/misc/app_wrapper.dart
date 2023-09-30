import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;
  final bool showTitle;
  final double toolbarHeight;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  const AppWrapper({
    super.key,
    required this.child,
    this.showTitle = true,
    this.toolbarHeight = 40,
    this.bottomNavigationBar,
    this.appBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SystemOverlayWrapper(
      child: Scaffold(
        appBar: appBar ??
            AppBar(
              backgroundColor: backgroundColor,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: toolbarHeight,
              title: showTitle
                  ? Text(
                      appName.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    )
                  : null,
              centerTitle: true,
            ),
        body: child,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
