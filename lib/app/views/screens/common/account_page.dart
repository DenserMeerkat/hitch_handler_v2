import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/controllers/controllers.dart';
import 'package:hitch_handler_v2/app/views/screens/common/profile_avatar.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/data/model/models.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:inner_drawer/inner_drawer.dart';
import 'package:tinycolor2/tinycolor2.dart';

class AccountPage extends StatelessWidget {
  final GlobalKey<InnerDrawerState> innerDrawerKey;
  const AccountPage({
    super.key,
    required this.innerDrawerKey,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    ThemeMode selectedThemeMode = themeProvider.selectedThemeMode;
    bool isAmoled = themeProvider.trueDark;
    final UserProvider userProvider = context.read<UserProvider>();
    final UserModel? user = userProvider.userModel;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: selectedThemeMode == ThemeMode.light
          ? Theme.of(context).colorScheme.surfaceVariant
          : isAmoled
              ? Theme.of(context)
                  .colorScheme
                  .surface
                  .mix(Theme.of(context).colorScheme.primary, 5)
              : Theme.of(context).colorScheme.onInverseSurface,
      child: Drawer(
        width: 300.w,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  color: Theme.of(context).colorScheme.surface,
                  child: Row(
                    children: [
                      const Gap(16),
                      Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: "Close",
                        onPressed: () {
                          innerDrawerKey.currentState!.close();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 18,
                        ),
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                const Gap(12),
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).padding.bottom -
                          90,
                    ),
                    child: Column(
                      children: [
                        ProfileAvatar(name: user?.name ?? "Unknown"),
                        const Gap(12),
                        Text(
                          user?.name ?? "Unknown",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: LongFilledButton(
                            label: "Reset Password",
                            onPressed: () {},
                            icon: Icons.password_rounded,
                            foreGroundColor:
                                Theme.of(context).colorScheme.secondary,
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        const Gap(4),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: LongFilledButton(
                            label: "Logout",
                            onPressed: () {
                              innerDrawerKey.currentState!.close();
                              AddPostController(context).reset();
                              FeedController(
                                userProvider.jwtToken!,
                                context,
                                isAdmin: userProvider.userModel!.userType ==
                                    UserEnum.admin,
                                domain: userProvider.userModel!.domain,
                              ).reset();
                              userProvider.logout();
                              context.go("/");
                            },
                            icon: Icons.logout_rounded,
                            foreGroundColor:
                                Theme.of(context).colorScheme.error,
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
