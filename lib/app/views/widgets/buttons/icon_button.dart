import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final Widget icon;
  final String tooltip;
  final Function()? onPressed;
  final double borderRadius;
  const CustomIconButton({
    super.key,
    this.iconData,
    this.icon = const Icon(Icons.arrow_back_outlined),
    this.tooltip = "Back",
    this.onPressed,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          maximumSize: const Size(50, 50),
        ),
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        icon: iconData == null ? icon : Icon(iconData),
        onPressed: onPressed != null
            ? () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                onPressed?.call();
              }
            : null,
      ),
    );
  }
}
