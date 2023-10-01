import 'package:flutter/material.dart';

class AppbarIconButton extends StatelessWidget {
  final IconData? iconData;
  final Widget icon;
  final String? tooltip;
  final Function()? onPressed;
  const AppbarIconButton({
    super.key,
    this.iconData,
    this.icon = const Icon(Icons.arrow_back_outlined),
    this.tooltip = "Back",
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            highlightColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
            icon: iconData == null ? icon : Icon(iconData),
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              onPressed?.call();
            },
            tooltip: tooltip,
          ),
        );
      },
    );
  }
}
