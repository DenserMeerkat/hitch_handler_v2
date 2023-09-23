import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/settings/theme/theme_mode/theme_segment.dart';

class ThemeModeSwitch extends StatelessWidget {
  ThemeModeSwitch({
    super.key,
  });

  final List<Widget> list = [
    const ThemeSegment(
      iconData: Icons.smartphone_outlined,
      label: "System",
      position: 0,
    ),
    const ThemeSegment(
      iconData: Icons.light_mode_outlined,
      label: "Light",
      position: 1,
    ),
    const ThemeSegment(
      iconData: Icons.dark_mode_outlined,
      label: "Dark",
      position: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        Theme.of(context).colorScheme.outlineVariant.withOpacity(0.4);
    return Container(
      height: 50,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxWidth: 330.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor.withOpacity(0.3),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          list[0],
          VerticalDivider(
            color: borderColor,
            thickness: 1,
            width: 1,
          ),
          list[1],
          VerticalDivider(
            color: borderColor,
            thickness: 1,
            width: 1,
          ),
          list[2],
        ],
      ),
    );
  }
}
