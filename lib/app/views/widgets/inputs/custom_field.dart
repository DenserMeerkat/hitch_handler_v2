import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

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
  late Color shadowColor;
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
        shadowColor = Theme.of(context).colorScheme.primary;
      } else {}
    });
  }

  void _onStateChange() {
    setState(() {
      final hasError = widget.validator?.call(widget.controller.text) != null;

      shadowColor = hasError
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    shadowColor = isDark(context) ? kBlack20 : kGrey40;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 300),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(1, 2),
            ),
          ]),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              TextFormField(
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
                onFieldSubmitted: (value) =>
                    {FocusScope.of(context).nextFocus()},
                style: TextStyle(
                  fontSize: widget.fontSize,
                  letterSpacing: widget.letterSpacing,
                ),
                obscureText: widget.obscureText ?? false,
                decoration: InputDecoration(
                  fillColor: isDark(context) ? kGrey50 : Colors.white,
                  isDense: true,
                  hintText: widget.placeHolder,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  contentPadding: const EdgeInsets.fromLTRB(70, 10, 12, 16),
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
              Container(
                decoration: BoxDecoration(
                    color: isDark(context) ? kBlack20 : kGrey40,
                    borderRadius: BorderRadius.horizontal(
                      left: const Radius.circular(8),
                      right: Radius.circular(1.r),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kBlack10,
                        blurRadius: 1,
                        offset: Offset(2, 0),
                      ),
                    ]),
                height: 48,
                width: 48,
                child: Center(
                    child: Icon(
                  widget.icon,
                  color: kStudentColor,
                  size: 20,
                )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
