import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/input_utils.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/phone_field.dart';
import 'custom_field.dart';

class MultiField extends StatefulWidget {
  final TextEditingController controller;
  final List<FieldType>? fields;
  final bool switchKeyBoards;
  final TextInputAction? textInputAction;
  final Function(bool)? updateIsPhoneLogin;
  final Function(String)? updateCountryCode;
  final bool enabled;
  const MultiField({
    super.key,
    required this.controller,
    this.fields,
    this.switchKeyBoards = true,
    this.textInputAction = TextInputAction.next,
    this.updateIsPhoneLogin,
    this.updateCountryCode,
    this.enabled = true,
  });

  @override
  State<MultiField> createState() => _MultiFieldState();
}

class _MultiFieldState extends State<MultiField> {
  final FocusNode focusNode = FocusNode();
  late List<FieldType> fields;
  late Widget suffix;
  late IconData _suffixIcon;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fields = widget.fields ?? MultiFields().list;
    _suffixIcon = fields[currentIndex].suffixIcon;
    widget.controller.addListener(_onStateChange);
    focusNode.addListener(_onStateChange);
  }

  @override
  Widget build(BuildContext context) {
    suffix = multiFieldButton(
        _suffixIcon, onTap, Theme.of(context).colorScheme.primary);
    if (fields[currentIndex].keyboardType == TextInputType.phone) {
      return PhoneField(
        controller: widget.controller,
        validator: fields[currentIndex].validator,
        placeHolder: fields[currentIndex].placeHolder,
        keyboardType: fields[currentIndex].keyboardType,
        textInputAction: widget.textInputAction,
        updateCountryCode: widget.updateCountryCode,
        icon: Icons.account_circle,
        suffixIcon: suffix,
        enabled: widget.enabled,
      );
    }
    return CustomField(
      controller: widget.controller,
      validator: fields[currentIndex].validator,
      placeHolder: fields[currentIndex].placeHolder,
      keyboardType: fields[currentIndex].keyboardType,
      textInputAction: widget.textInputAction,
      icon: Icons.account_circle,
      suffixIcon: suffix,
      focusNode: focusNode,
      enabled: widget.enabled,
    );
  }

  void _onStateChange() {
    if (!mounted) return;
    if (widget.controller.text.isNotEmpty && focusNode.hasFocus) {
      setState(() {
        suffix = clearButton(widget.controller);
      });
    } else {
      setState(() {
        suffix = multiFieldButton(
            _suffixIcon, onTap, Theme.of(context).colorScheme.primary);
      });
    }
  }

  void onTap() {
    if (!mounted) return;
    setState(() {
      currentIndex = currentIndex == fields.length - 1 ? 0 : currentIndex + 1;
      if (fields[currentIndex].keyboardType == TextInputType.phone) {
        widget.updateIsPhoneLogin?.call(true);
      } else {
        widget.updateIsPhoneLogin?.call(false);
      }
      _suffixIcon = fields[currentIndex].suffixIcon;
      suffix =
          multiFieldButton(_suffixIcon, onTap, Theme.of(context).primaryColor);
      widget.controller.clear();
      if (widget.switchKeyBoards) {
        focusNode.unfocus();
        if (focusNode.hasFocus) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              Future.delayed(const Duration(milliseconds: 250), () {
                focusNode.requestFocus();
              });
            },
          );
        }
      }
    });
  }
}
