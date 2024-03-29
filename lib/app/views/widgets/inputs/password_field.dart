import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'custom_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? placeHolder;
  final bool showErrors;
  final bool enabled;
  const PasswordField({
    super.key,
    required this.controller,
    this.validator,
    this.placeHolder = "Password",
    this.showErrors = true,
    this.enabled = true,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final FocusNode focusNode = FocusNode();
  bool obscureText = true;
  double letterSpacing = 1.5;
  late Widget suffix;

  @override
  Widget build(BuildContext context) {
    suffix = obscureButton(
        obscureText, onTap, Theme.of(context).colorScheme.primary);
    return CustomField(
      controller: widget.controller,
      validator: widget.validator ?? passwordValidator,
      placeHolder: widget.placeHolder,
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.password_outlined,
      suffixIcon: suffix,
      obscureText: obscureText,
      letterSpacing: letterSpacing,
      focusNode: focusNode,
      showErrors: widget.showErrors,
      enabled: widget.enabled,
    );
  }

  void onTap() {
    if (!mounted) return;
    setState(() {
      obscureText = !obscureText;
      letterSpacing = obscureText ? 1.5 : 1.2;
      suffix = obscureButton(
          obscureText, onTap, Theme.of(context).colorScheme.primary);
    });
  }
}
