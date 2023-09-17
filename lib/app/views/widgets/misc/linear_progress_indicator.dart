import 'package:flutter/material.dart';

class LProgressIndicator extends StatelessWidget {
  const LProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      backgroundColor: Colors.transparent,
      minHeight: 3,
      borderRadius: BorderRadius.all(Radius.circular(3)),
    );
  }
}
