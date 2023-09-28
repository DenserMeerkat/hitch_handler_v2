import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/settings_button.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? actions;
  const CustomAppBar(
      {super.key, this.leading, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
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
                children: [title],
              ),
              actions ?? const SettingsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
