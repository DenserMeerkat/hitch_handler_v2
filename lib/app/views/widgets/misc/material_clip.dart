import 'package:flutter/material.dart';

class MaterialClip extends StatelessWidget {
  final double? borderRadius;
  final Widget? child;
  const MaterialClip({
    super.key,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        child: Material(
          color: Colors.transparent,
          child: child,
        ));
  }
}

class MaterialClip1 extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  const MaterialClip1({
    super.key,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Material(
          color: Colors.transparent,
          child: child,
        ));
  }
}
