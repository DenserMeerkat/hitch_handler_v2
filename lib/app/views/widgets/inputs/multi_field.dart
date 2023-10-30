import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/input_utils.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/phone_field.dart';
import 'custom_field.dart';

class MultiField extends StatefulWidget {
  final TextEditingController controller;
  final List<FieldType> fields;
  final bool switchKeyBoards;
  final TextInputAction? textInputAction;
  final Function(bool)? updateIsPhoneLogin;
  final Function(String)? updateCountryCode;
  final int currentIndex;
  final bool enabled;
  const MultiField({
    super.key,
    required this.controller,
    required this.fields,
    this.switchKeyBoards = true,
    this.textInputAction = TextInputAction.next,
    this.updateIsPhoneLogin,
    this.updateCountryCode,
    this.currentIndex = 0,
    this.enabled = true,
  });

  @override
  State<MultiField> createState() => _MultiFieldState();
}

class _MultiFieldState extends State<MultiField> {
  final FocusNode focusNode = FocusNode();
  late Widget suffix;
  late IconData _suffixIcon;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    _suffixIcon = widget.fields[currentIndex].suffixIcon;
    widget.controller.addListener(_onStateChange);
    focusNode.addListener(_onStateChange);
  }

  @override
  void didUpdateWidget(covariant MultiField oldWidget) {
    if (currentIndex > widget.fields.length - 1) {
      currentIndex = 0;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _suffixIcon = widget.fields[currentIndex].suffixIcon;
    suffix = multiFieldButton(
        _suffixIcon, onTap, Theme.of(context).colorScheme.primary);
    if (widget.fields[currentIndex].keyboardType == TextInputType.phone) {
      return PhoneField(
        controller: widget.controller,
        validator: widget.fields[currentIndex].validator,
        placeHolder: widget.fields[currentIndex].placeHolder,
        keyboardType: widget.fields[currentIndex].keyboardType,
        textInputAction: widget.textInputAction,
        updateCountryCode: widget.updateCountryCode,
        icon: Icons.account_circle,
        suffixIcon: suffix,
        focusNode: focusNode,
        enabled: widget.enabled,
      );
    }
    return CustomField(
      controller: widget.controller,
      validator: widget.fields[currentIndex].validator,
      placeHolder: widget.fields[currentIndex].placeHolder,
      keyboardType: widget.fields[currentIndex].keyboardType,
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
      currentIndex =
          currentIndex == widget.fields.length - 1 ? 0 : currentIndex + 1;
      if (widget.fields[currentIndex].keyboardType == TextInputType.phone) {
        widget.updateIsPhoneLogin?.call(true);
      } else {
        widget.updateIsPhoneLogin?.call(false);
      }
      _suffixIcon = widget.fields[currentIndex].suffixIcon;
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
