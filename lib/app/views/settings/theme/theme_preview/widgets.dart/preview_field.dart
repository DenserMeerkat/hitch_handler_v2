import 'package:flutter/material.dart';

class PreviewField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final IconData suffixIcon;
  final bool isDarkMode;
  const PreviewField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.suffixIcon,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 8,
          width: 8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDarkMode
                ? Theme.of(context).colorScheme.onTertiary
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(2),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                offset: const Offset(0.2, 0),
              ),
            ],
          ),
          child: Icon(
            prefixIcon,
            color: isDarkMode
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.onPrimaryContainer,
            size: 4,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 4),
          alignment: Alignment.centerLeft,
          height: 8,
          width: 45,
          color: isDarkMode
              ? Theme.of(context)
                  .inputDecorationTheme
                  .fillColor!
                  .withOpacity(0.6)
              : Theme.of(context).cardColor,
          child: Text(
            hintText,
            style: TextStyle(
              fontSize: 2.5,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        Container(
          height: 8,
          width: 8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDarkMode
                ? Theme.of(context)
                    .inputDecorationTheme
                    .fillColor!
                    .withOpacity(0.6)
                : Theme.of(context).cardColor,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(2),
            ),
          ),
          child: Icon(
            suffixIcon,
            color: isDarkMode
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.onPrimaryContainer,
            size: 4,
          ),
        ),
      ],
    );
  }
}
