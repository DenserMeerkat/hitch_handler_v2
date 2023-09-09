import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/more_vert.dart';

class HomeAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? actions;
  const HomeAppBar(
      {super.key, this.leading, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading ??
            const LeadingWidget(
              onPressed: null,
              tooltip: "Exit",
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title,
          ],
        ),
        actions ?? const MoreVert(),
      ],
    );
  }
}
