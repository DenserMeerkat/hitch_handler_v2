import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/color_icon_button.dart';

class ProfileFlex extends StatelessWidget {
  const ProfileFlex({
    super.key,
  });

  @override
  FlexibleSpaceBar build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ProfileAvatar(),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ragul Raj M",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "@DenserMeerkat11",
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "CSE",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.8),
                            fontSize: 12.sp,
                            letterSpacing: 0,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("•"),
                        ),
                        Text(
                          "2025",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.8),
                            fontSize: 12.sp,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                ColorIconButton(
                  tooltip: "Account actions",
                  onTap: () {},
                  icon: Icons.manage_accounts_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context)
            .colorScheme
            .primary
            .withOpacity(isDarkMode ? 0.2 : 0.3),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 0.1,
        ),
      ),
      child: Text(
        "RR",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
