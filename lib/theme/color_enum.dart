import 'package:flutter/material.dart';

enum ColorEnum { primary, secondary, tertiary }

class ColorFamily {
  final Color color;
  final Color colorContainer;
  final Color onColor;
  final Color onColorContainer;
  ColorFamily({
    required this.color,
    required this.colorContainer,
    required this.onColor,
    required this.onColorContainer,
  });
}

ColorFamily getColorFamily(ColorEnum color, BuildContext context) {
  switch (color) {
    case ColorEnum.primary:
      return ColorFamily(
        color: Theme.of(context).colorScheme.primary,
        colorContainer: Theme.of(context).colorScheme.primaryContainer,
        onColor: Theme.of(context).colorScheme.onPrimary,
        onColorContainer: Theme.of(context).colorScheme.onPrimaryContainer,
      );
    case ColorEnum.secondary:
      return ColorFamily(
        color: Theme.of(context).colorScheme.secondary,
        colorContainer: Theme.of(context).colorScheme.secondaryContainer,
        onColor: Theme.of(context).colorScheme.onSecondary,
        onColorContainer: Theme.of(context).colorScheme.onSecondaryContainer,
      );
    case ColorEnum.tertiary:
      return ColorFamily(
        color: Theme.of(context).colorScheme.tertiary,
        colorContainer: Theme.of(context).colorScheme.tertiaryContainer,
        onColor: Theme.of(context).colorScheme.onTertiary,
        onColorContainer: Theme.of(context).colorScheme.onTertiaryContainer,
      );
    default:
      return ColorFamily(
        color: Theme.of(context).colorScheme.primary,
        colorContainer: Theme.of(context).colorScheme.primaryContainer,
        onColor: Theme.of(context).colorScheme.onPrimary,
        onColorContainer: Theme.of(context).colorScheme.onPrimaryContainer,
      );
  }
}
