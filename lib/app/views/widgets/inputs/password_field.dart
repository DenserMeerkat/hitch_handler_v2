import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/app/utils/inputs/validators.dart';
import 'custom_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool obscureText = true;
  double letterSpacing = 1.5;
  late Widget suffix;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {});
    suffix = obscureButton(obscureText, onTap);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTap() {
    setState(() {
      obscureText = !obscureText;
      letterSpacing = obscureText ? 1.5 : 1.2;
      suffix = obscureButton(obscureText, onTap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      controller: passwordController,
      validator: passwordValidator,
      placeHolder: "Password",
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.password_outlined,
      suffixIcon: suffix,
      obscureText: obscureText,
      letterSpacing: letterSpacing,
      focusNode: focusNode,
    );
  }
}
