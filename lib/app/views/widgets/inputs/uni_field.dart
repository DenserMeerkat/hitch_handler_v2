import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'custom_field.dart';

class UniField extends StatefulWidget {
  final FieldType type;
  final IconData? icon;
  const UniField({super.key, required this.type, this.icon});

  @override
  State<UniField> createState() => _UniFieldState();
}

class _UniFieldState extends State<UniField> {
  final TextEditingController conntroller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late Widget suffix;
  @override
  void initState() {
    super.initState();
    conntroller.addListener(_onStateChange);
    focusNode.addListener(() {
      _onStateChange();
    });
  }

  @override
  void dispose() {
    super.dispose();
    conntroller.dispose();
  }

  void _onStateChange() {
    if (conntroller.text.isNotEmpty && focusNode.hasFocus) {
      setState(() {
        suffix = clearButton(conntroller);
      });
    } else {
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
    return CustomField(
      controller: conntroller,
      validator: widget.type.validator,
      placeHolder: widget.type.placeHolder,
      keyboardType: widget.type.keyboardType,
      icon: widget.icon,
      suffixIcon: suffix,
      focusNode: focusNode,
    );
  }
}
