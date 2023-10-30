import 'package:flutter/material.dart';

class PreviewAuthBottom extends StatelessWidget {
  final int index;
  const PreviewAuthBottom({
    super.key,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      child: SizedBox(
        height: 14,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: 12,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(0.2)),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 3,
                      fontWeight: FontWeight.w500,
                      color: index == 0
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: 10,
                    decoration: BoxDecoration(
                      color: index == 1
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(0.2)),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 3,
                      fontWeight: FontWeight.w500,
                      color: index == 1
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
