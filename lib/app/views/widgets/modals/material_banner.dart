import 'package:flutter/material.dart';

MaterialBanner showCustomMaterialBanner(
  BuildContext context, {
  String? contentText,
  Widget? content,
  double elevation = 0,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  List<Widget>? actions,
  Widget? leading,
  bool forceActionsBelow = false,
  void Function()? onVisible,
  Color? backgroundColor,
}) {
  return MaterialBanner(
    content: content ?? Text(contentText ?? "<Banner Content>"),
    leading: leading,
    elevation: elevation,
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('DISMISS'),
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },
      ),
    ],
    backgroundColor: backgroundColor,
    margin: margin,
    padding: padding,
    onVisible: onVisible,
    forceActionsBelow: forceActionsBelow,
  );
}
