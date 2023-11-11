import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class AmoledSwitch extends StatelessWidget {
  const AmoledSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.science_rounded,
                  size: 8,
                ),
                Gap(2),
                Text(
                  "Expt.",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          const Text(
            "AMOLED Dark",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: Switch(
        value: context.read<ThemeProvider>().trueDark,
        onChanged: (value) {
          context.read<ThemeProvider>().updateTrueDark(value);
        },
      ),
    );
  }
}
