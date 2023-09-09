import 'package:flutter/material.dart';

class IllustrationType {
  const IllustrationType({
    required this.pathName,
    this.semanticLabel,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.padding,
    this.darkenValue = 70,
    this.mixValue = 15,
    this.mixColor,
    this.lightDarkenValue = 0,
    this.lightMixValue = 10,
    this.lightMixColor,
  });

  final String pathName;
  final String? semanticLabel;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final Widget? errorWidget;
  final EdgeInsets? padding;
  final int darkenValue;
  final int mixValue;
  final Color? mixColor;
  final int lightDarkenValue;
  final Color? lightMixColor;
  final int lightMixValue;
}
