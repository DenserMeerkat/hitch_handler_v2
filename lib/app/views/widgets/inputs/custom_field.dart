import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? placeHolder;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final double? fontSize;
  final double? letterSpacing;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  const CustomField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.placeHolder,
    this.icon = Icons.title,
    this.suffixIcon,
    this.obscureText,
    this.fontSize = 13,
    this.letterSpacing = 1,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
  });
  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  _CustomFieldState();
  late Color prefixIconBoxColor;
  late Color shadowColor;
  double shadowX = 3;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onStateChange);
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode?.removeListener(_onFocusChange);
    widget.focusNode?.dispose();
  }

  void _onFocusChange() {
    if (widget.focusNode == null) return;
    setState(() {
      if (widget.focusNode!.hasFocus) {
        shadowX = 4;
      } else {
        shadowX = 3;
      }
    });
  }

  void _onStateChange() {
    setState(() {
      final hasError = widget.validator?.call(widget.controller.text) != null;
      prefixIconBoxColor = hasError
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.inversePrimary;
      shadowColor = hasError
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    prefixIconBoxColor = Theme.of(context).colorScheme.inversePrimary;
    shadowColor = Theme.of(context).colorScheme.primary;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 1, 0, 0),
          child: TextFormField(
            onTapOutside: (event) {
              widget.focusNode?.unfocus();
            },
            onEditingComplete: () {
              widget.focusNode?.unfocus();
            },
            focusNode: widget.focusNode,
            controller: widget.controller,
            validator: widget.validator,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: (value) => {FocusScope.of(context).nextFocus()},
            style: TextStyle(
              fontSize: widget.fontSize,
              letterSpacing: widget.letterSpacing,
            ),
            obscureText: widget.obscureText ?? false,
            decoration: InputDecoration(
              hintText: widget.placeHolder,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              contentPadding: const EdgeInsets.fromLTRB(70, 16, 12, 16),
              hintStyle: const TextStyle(
                fontSize: 12.0,
                letterSpacing: 2,
              ),
              suffixIcon: widget.suffixIcon,
              border: inputBorder("border", context),
              errorBorder: inputBorder("error", context),
              disabledBorder: inputBorder("disabled", context),
              enabledBorder: inputBorder("enabled", context),
              focusedBorder: inputBorder("focused", context),
              focusedErrorBorder: inputBorder("focusedError", context),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: prefixIconBoxColor,
              borderRadius: BorderRadius.horizontal(
                left: const Radius.circular(8),
                right: Radius.circular(1.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: Offset(shadowX, 0),
                ),
                BoxShadow(
                  color: Theme.of(context).colorScheme.surface,
                  offset: const Offset(2, 0),
                ),
              ]),
          height: 54,
          width: 60,
          child: Center(
              child: Icon(
            widget.icon,
            size: 20,
          )),
        )
      ],
    );
  }
}
