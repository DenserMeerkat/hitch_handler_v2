import 'package:flutter/material.dart';

class TertiaryIconButton extends StatelessWidget {
  final String? tooltip;
  final Function()? onTap;
  final IconData icon;
  const TertiaryIconButton({
    super.key,
    this.tooltip,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.tertiary,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
