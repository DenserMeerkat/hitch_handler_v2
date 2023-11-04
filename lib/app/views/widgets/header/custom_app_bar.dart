import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/icon_button.dart';
import 'package:hitch_handler_v2/theme/constants.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? actions;
  final Color? backgroundColor;
  final bool showLeading;
  final bool showActions;
  final double thickness;
  final double borderRadius;
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
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: Text(
            appName.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: thickness),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4),
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(borderRadius)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  offset: Offset(0, -thickness),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showLeading
                    ? leading ??
                        const CustomIconButton(
                          onPressed: null,
                          tooltip: "Exit",
                        )
                    : const Gap(50),
                title,
                showActions
                    ? actions ??
                        CustomIconButton(
                          icon: const Icon(Icons.settings_outlined),
                          onPressed: () {
                            context.push("/settings");
                          },
                          tooltip: "Settings",
                        )
                    : const Gap(0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
