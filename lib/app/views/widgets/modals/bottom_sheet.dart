import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

showCustomModalBottomSheet(BuildContext context, Widget child,
    {bool isScrollControlled = true}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    builder: (context) {
      return Container(
          color: isDark(context)
              ? Theme.of(context).canvasColor
              : Theme.of(context).highlightColor,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: child);
    },
  );
}

class BottomSheetHeader extends StatelessWidget {
  final String? title;
  const BottomSheetHeader({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: title == null ? 30 : 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          if (title != null) ...[
            const SizedBox(height: 16),
            Text(
              title!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
