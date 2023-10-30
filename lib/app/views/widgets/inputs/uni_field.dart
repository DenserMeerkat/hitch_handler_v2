import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/input_utils.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';

class UniField extends StatefulWidget {
  final TextEditingController controller;
  final FieldType type;
  final IconData? icon;
  final Function(String)? updateCountryCode;
  final bool enabled;
  const UniField({
    super.key,
    required this.controller,
    required this.type,
    this.icon,
    this.updateCountryCode,
    this.enabled = true,
  });

  @override
  State<UniField> createState() => _UniFieldState();
}

class _UniFieldState extends State<UniField> {
  final FocusNode focusNode = FocusNode();
  late Widget suffix;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onStateChange);
    focusNode.addListener(() {
      _onStateChange();
    });
  }

  void _onStateChange() {
    if (!mounted) return;
    if (widget.controller.text.isNotEmpty && focusNode.hasFocus) {
      if (!mounted) return;
      setState(() {
        suffix = clearButton(widget.controller);
      });
    } else {
      if (!mounted) return;
      setState(() {
        suffix = suffixIcon(
            widget.type.suffixIcon, Theme.of(context).colorScheme.primary);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    suffix = suffixIcon(
        widget.type.suffixIcon, Theme.of(context).colorScheme.primary);
    if (widget.type == MultiFields.mobile) {
      return PhoneField(
        controller: widget.controller,
        validator: widget.type.validator,
        placeHolder: widget.type.placeHolder,
        keyboardType: widget.type.keyboardType,
        updateCountryCode: widget.updateCountryCode,
        icon: widget.icon,
        suffixIcon: suffix,
        focusNode: focusNode,
      );
    }
    return CustomField(
      controller: widget.controller,
      validator: widget.type.validator,
      placeHolder: widget.type.placeHolder,
      keyboardType: widget.type.keyboardType,
      icon: widget.icon,
      suffixIcon: suffix,
      focusNode: focusNode,
    );
  }
}
