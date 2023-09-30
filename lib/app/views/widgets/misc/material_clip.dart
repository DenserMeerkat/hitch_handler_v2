import 'package:flutter/material.dart';

class MaterialClip extends StatelessWidget {
  final double? borderRadius;
  final Widget? child;
  const MaterialClip({
    super.key,
    this.borderRadius = 8,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: Material(
          color: Colors.transparent,
          child: child,
        ));
  }
}
