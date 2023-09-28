import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/illustration_type.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/svg_asset_image.dart';

class Illustrations {
  static const IllustrationType login = IllustrationType(
    pathName: "assets/illustrations/undraw_login.svg",
    height: 140,
    lightMixValue: 15,
  );
  static const IllustrationType signUp = IllustrationType(
    pathName: "assets/illustrations/undraw_sign_up.svg",
    height: 140,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType accessAccount = IllustrationType(
    pathName: "assets/illustrations/undraw_access_account.svg",
    height: 170,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType mobileLogin = IllustrationType(
    pathName: "assets/illustrations/undraw_mobile_login.svg",
    height: 160,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType darkMode = IllustrationType(
    pathName: "assets/illustrations/undraw_dark_mode.svg",
    height: 200,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType forgotPassword = IllustrationType(
    pathName: "assets/illustrations/undraw_forgot_password.svg",
    height: 140,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType confidentialLetter = IllustrationType(
    pathName: "assets/illustrations/undraw_confidential_letter.svg",
    height: 160,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType letter = IllustrationType(
    pathName: "assets/illustrations/undraw_letter.svg",
    height: 160,
    lightMixValue: 10,
    mixValue: 10,
  );
  static const IllustrationType safe = IllustrationType(
    pathName: "assets/illustrations/undraw_safe.svg",
    height: 160,
    lightMixValue: 10,
    mixValue: 10,
  );

  static Widget renderSignIn(BuildContext context, bool isDark,
          {double? height, double? width, double? padding}) =>
      SvgAssetImage(
        illustration: accessAccount,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark,
        height: height,
        width: width,
        padding: padding,
      );

  static Widget renderSignUp(BuildContext context, bool isDark,
          {double? height, double? width, double? padding}) =>
      SvgAssetImage(
        illustration: mobileLogin,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark,
        height: height,
        width: width,
        padding: padding,
      );
  static Widget renderTheme(BuildContext context, bool isDark,
          {double? height, double? width, double? padding}) =>
      SvgAssetImage(
        illustration: darkMode,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark,
        height: height,
        width: width,
        padding: padding,
      );
  static Widget renderForgotPassword(BuildContext context, bool isDark,
          {double? height, double? width, double? padding}) =>
      SvgAssetImage(
        illustration: forgotPassword,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark,
        height: height,
        width: width,
        padding: padding,
      );
  static Widget renderOtp(BuildContext context, bool isDark,
          {double? height, double? width, double? padding}) =>
      SvgAssetImage(
        illustration: confidentialLetter,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark,
        height: height,
        width: width,
        padding: padding,
      );
  static Widget renderConfirmPass(BuildContext context, bool isDark,
          {double? height, double? width, double? padding}) =>
      SvgAssetImage(
        illustration: safe,
        color: Theme.of(context).colorScheme.primary,
        isDark: isDark,
        height: height,
        width: width,
        padding: padding,
      );
}