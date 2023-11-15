import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/controllers/feed_controller.dart';
import 'package:hitch_handler_v2/app/controllers/post_controller.dart';
import 'package:hitch_handler_v2/app/views/screens/common/profile_avatar.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/color_icon_button.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:hitch_handler_v2/data/model/models.dart';

class ProfileFlex extends StatelessWidget {
  const ProfileFlex({
    super.key,
  });

  @override
  FlexibleSpaceBar build(BuildContext context) {
    final UserProvider userProvider = context.read<UserProvider>();
    final UserModel? user = userProvider.userModel;
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
                ProfileAvatar(name: user?.name ?? "Unknown"),
                Gap(15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.name ?? "Unknown",
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
                  tooltip: "Logout",
                  onTap: () {
                    PostController(context).reset();
                    FeedController(
                      userProvider.jwtToken!,
                      context,
                      isAdmin:
                          userProvider.userModel!.userType == UserEnum.admin,
                      domain: userProvider.userModel!.domain,
                    ).reset();
                    userProvider.logout();
                    context.go("/");
                  },
                  icon: Icons.logout_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
