import 'package:flutter/material.dart';

class FilterChipW extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final Color? borderColor;
  const FilterChipW({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
      decoration: BoxDecoration(
        color: (color ?? Theme.of(context).colorScheme.secondaryContainer)
            .withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor ?? Theme.of(context).colorScheme.secondary,
          width: 0.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
