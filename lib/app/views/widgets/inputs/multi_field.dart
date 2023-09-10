import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/app/types/input_types.dart';
import 'custom_field.dart';

class MultiField extends StatefulWidget {
  final TextEditingController controller;
  const MultiField({
    super.key,
    required this.controller,
  });

  @override
  State<MultiField> createState() => _MultiFieldState();
}

class _MultiFieldState extends State<MultiField> {
  final FocusNode focusNode = FocusNode();
  List<FieldType> fields = MultiFields().list;
  int currentIndex = 0;
  late Widget suffix;
  late IconData _suffixIcon;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onStateChange);
    focusNode.addListener(() {
      _onStateChange();
    });
    _suffixIcon = fields[currentIndex].suffixIcon;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  void _onStateChange() {
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
    setState(() {
      currentIndex = currentIndex == fields.length - 1 ? 0 : currentIndex + 1;
      _suffixIcon = fields[currentIndex].suffixIcon;
      suffix =
          multiFieldButton(_suffixIcon, onTap, Theme.of(context).primaryColor);
      widget.controller.clear();
      focusNode.unfocus();
      if (focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            Future.delayed(const Duration(milliseconds: 500), () {
              focusNode.requestFocus();
            });
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    suffix =
        multiFieldButton(_suffixIcon, onTap, Theme.of(context).primaryColor);
    return CustomField(
      controller: widget.controller,
      validator: fields[currentIndex].validator,
      placeHolder: fields[currentIndex].placeHolder,
      keyboardType: fields[currentIndex].keyboardType,
      icon: Icons.account_circle,
      suffixIcon: suffix,
      focusNode: focusNode,
    );
  }
}
