import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/appbar_icon_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/settings_button.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? actions;
  final Color? backgroundColor;
  final bool? showLeading;
  final bool? showActions;
  final double? thickness;
  final double? borderRadius;
  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.showLeading = true,
    this.showActions = true,
    this.thickness = 5,
    this.borderRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.only(top: thickness!),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(borderRadius!)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                offset: Offset(0, -thickness!),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showLeading!
                  ? leading ??
                      const AppbarIconButton(
                        onPressed: null,
                        tooltip: "Exit",
                      )
                  : const SizedBox(width: 50),
              title,
              showActions!
                  ? actions ?? const SettingsButton()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
