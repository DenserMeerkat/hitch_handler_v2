import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/illustration_type.dart';
import 'package:hitch_handler_v2/theme/svg_asset_image.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class Illustrations {
  static const IllustrationType signIn = IllustrationType(
    pathName: "assets/svg/illustrations/undraw_login.svg",
    height: 160,
    lightMixValue: 15,
  );

  static const IllustrationType signUp = IllustrationType(
    pathName: "assets/svg/illustrations/undraw_access_account.svg",
    height: 200,
    lightMixValue: 10,
    mixValue: 10,
  );

  static Widget renderSignIn(BuildContext context) => SvgAssetImage(
        illustration: signIn,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark(context),
      );
  static Widget renderSignUp(BuildContext context) => SvgAssetImage(
        illustration: signUp,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark(context),
      );
}
