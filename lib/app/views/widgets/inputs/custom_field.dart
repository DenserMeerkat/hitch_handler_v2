import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:tinycolor2/tinycolor2.dart';

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
  final double? fontSize;
  final double? letterSpacing;
  final bool readOnly;
  final bool? enabled;
  final bool showErrors;
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
    this.enabled = true,
    this.showErrors = true,
  });
  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late Color shadowColor;
  late bool hasError = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      _onChange(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = isDark(context);
    shadowColor =
        Theme.of(context).inputDecorationTheme.fillColor!.withOpacity(0.6);
    _onChange(1);
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
                  renderFieldBase(context, shadowColor),
                  TextFormField(
                    enabled: widget.enabled,
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
                        });
                        if (widget.showErrors) _onChange(1);
                      }
                      return res;
                    },
                    onChanged: widget.onChanged,
                    keyboardType: widget.keyboardType,
                    keyboardAppearance:
                        isDarkMode ? Brightness.dark : Brightness.light,
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
                  renderFieldIcon(context, widget.icon)
                ],
              ),
              Offstage(
                offstage: widget.showErrors ? !hasError : true,
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
                    const Gap(4),
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                      size: 12,
                    ),
                    const Gap(8),
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
    if (!mounted) return;
    final bool isDarkMode = isDark(context);
    String string = widget.controller.text;
    if (string.isEmpty && type == 0) {
      setState(() {
        hasError = false;
        shadowColor = isDarkMode
            ? Theme.of(context).inputDecorationTheme.fillColor!.withOpacity(0.6)
            : Theme.of(context).cardColor;
      });
    } else if (widget.validator?.call(string) == null) {
      setState(() {
        hasError = false;
        shadowColor = isDarkMode
            ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
            : Theme.of(context)
                .colorScheme
                .primaryContainer
                .mix(Colors.white, 50);
      });
    } else if (!hasError && widget.controller.text.isNotEmpty) {
      setState(() {
        shadowColor = isDarkMode
            ? Theme.of(context).colorScheme.tertiary.withOpacity(0.3)
            : Theme.of(context).colorScheme.tertiaryContainer;
      });
    } else if (hasError) {
      setState(() {
        shadowColor = isDarkMode
            ? Theme.of(context).colorScheme.error.withOpacity(0.3)
            : Theme.of(context).colorScheme.errorContainer;
      });
    } else {
      setState(() {
        shadowColor = isDarkMode
            ? Theme.of(context).inputDecorationTheme.fillColor!.withOpacity(0.6)
            : Theme.of(context).cardColor;
      });
    }
  }
}
