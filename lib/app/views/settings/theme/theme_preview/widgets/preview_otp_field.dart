import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

class PreviewOtpField extends StatelessWidget {
  const PreviewOtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 4,
      color: Theme.of(context).colorScheme.onTertiaryContainer,
    );
    return Container(
      height: 10,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.5),
        color: isDark(context)
            ? Theme.of(context).colorScheme.tertiary.withOpacity(0.6)
            : Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "4",
            style: textStyle,
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 10,
            width: 0.6,
          ),
          Text(
            "8",
            style: textStyle,
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 10,
            width: 0.6,
          ),
          Text(
            "5",
            style: textStyle,
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 10,
            width: 0.6,
          ),
          Text(
            "6",
            style: textStyle,
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 10,
            width: 0.6,
          ),
          Text(
            "3",
            style: textStyle,
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 10,
            width: 0.6,
          ),
          Text(
            "2",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
