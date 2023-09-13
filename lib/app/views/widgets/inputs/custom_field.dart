import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';
import 'package:pinput/pinput.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? placeHolder;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool? obscureText;
  final bool readOnly;
  final double? fontSize;
  final double? letterSpacing;
  const CustomField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.placeHolder,
    this.icon = Icons.title,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.fontSize = 13,
    this.letterSpacing = 1,
    this.readOnly = false,
  });
  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late Color shadowColor = isDark(context) ? kGrey50 : Colors.white;
  late bool hasError = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      _onChange(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onChange(1);
    const hiddenTextStyle = TextStyle(
      fontSize: 0.0,
      height: 0,
      letterSpacing: 2,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  AnimatedContainer(
                    height: 48,
                    decoration: BoxDecoration(
                      color: shadowColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: isDark(context) ? kBlack15 : kLGrey30,
                          offset: const Offset(0, 1.2),
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                  ),
                  TextFormField(
                    onTap: widget.onTap,
                    readOnly: widget.readOnly,
                    onEditingComplete: () {
                      widget.focusNode?.unfocus();
                    },
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                    validator: (value) {
                      final String? res = widget.validator?.call(value);
                      if (mounted) {
                        setState(() {
                          hasError = res == null ? false : true;
                          debugPrint(res.toString());
                          debugPrint(hasError.toString());
                          _onChange(1);
                        });
                      }
                      return res;
                    },
                    onChanged: widget.onChanged,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      letterSpacing: widget.letterSpacing,
                    ),
                    obscureText: widget.obscureText ?? false,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      isDense: true,
                      hintText: widget.placeHolder,
                      helperText: '_',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      contentPadding: const EdgeInsets.fromLTRB(65, 10, 12, 16),
                      hintStyle: const TextStyle(
                        fontSize: 12.0,
                        letterSpacing: 2,
                      ),
                      helperStyle: hiddenTextStyle,
                      errorStyle: hiddenTextStyle,
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
                        color: isDark(context)
                            ? kBlack20
                            : Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.horizontal(
                          left: const Radius.circular(8),
                          right: Radius.circular(1.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isDark(context) ? kBlack10 : kLBlack20,
                            blurRadius: 1,
                            offset: const Offset(2, 0),
                          ),
                        ]),
                    height: 48,
                    width: 48,
                    child: Center(
                        child: Icon(
                      widget.icon,
                      color: isDark(context)
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 20,
                    )),
                  )
                ],
              ),
              Offstage(
                offstage: !hasError,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      hasError
                          ? widget.validator!.call(widget.controller.text) ?? ""
                          : "",
                      style: TextStyle(
                        fontSize: hasError ? 11 : 0,
                        height: hasError ? 1.2 : 0,
                        letterSpacing: 1,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                      size: 12,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _onChange(int type) {
    String string = widget.controller.text;
    if (!mounted) return;
    if (string.isEmpty && type == 0) {
      setState(() {
        debugPrint("Empty ${type.toString()}");
        hasError = false;
        shadowColor = isDark(context) ? kGrey50 : Colors.white;
      });
    } else if (widget.validator?.call(string) == null) {
      setState(() {
        debugPrint("no Erropr");
        hasError = false;
        shadowColor = isDark(context)
            ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
            : Theme.of(context).colorScheme.primaryContainer;
      });
    } else if (!hasError && widget.controller.length > 0) {
      setState(() {
        debugPrint("has Erropr");
        shadowColor = isDark(context)
            ? Theme.of(context).colorScheme.tertiary.withOpacity(0.3)
            : Theme.of(context).colorScheme.tertiaryContainer;
      });
    } else if (hasError) {
      setState(() {
        shadowColor = isDark(context)
            ? Theme.of(context).colorScheme.error.withOpacity(0.3)
            : Theme.of(context).colorScheme.errorContainer;
      });
    } else {
      setState(() {
        debugPrint("Empty ${type.toString()}");
        shadowColor = isDark(context) ? kGrey50 : Colors.white;
      });
    }
  }
}
