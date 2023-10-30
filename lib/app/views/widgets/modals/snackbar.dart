import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar showSnackBar(
  BuildContext context, {
  String? contentText,
  Widget? content,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  SnackBarAction? action,
  SnackBarBehavior? behavior,
  double rightLeftMargin = 30,
  double bottomMargin = 0,
  bool showCloseIcon = false,
  void Function()? onVisible,
  Color? backgroundColor,
  Color? closeIconColor,
  DismissDirection? dismissDirection,
  double? width,
}) {
  return SnackBar(
    content: content ??
        Text(
          contentText ?? "<SnackBar Content>",
          style: Theme.of(context).snackBarTheme.contentTextStyle,
        ),
    backgroundColor:
        backgroundColor ?? Theme.of(context).snackBarTheme.backgroundColor,
    margin: behavior != SnackBarBehavior.fixed
        ? margin ??
            EdgeInsets.only(
              left: rightLeftMargin.w,
              top: 0,
              right: rightLeftMargin.w,
              bottom: bottomMargin,
            )
        : null,
    width: width,
    padding: padding,
    onVisible: onVisible,
    action: action,
    behavior: behavior ?? SnackBarBehavior.floating,
    showCloseIcon: showCloseIcon,
    closeIconColor: closeIconColor,
    dismissDirection: dismissDirection ?? DismissDirection.down,
  );
}
