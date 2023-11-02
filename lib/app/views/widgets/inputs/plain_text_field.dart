import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';

class PlainTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? placeHolder;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled;
  final double maxWidth;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double hintFontSize;
  final double hintLetterSpacing;
  final FontWeight hintFontWeight;
  final int maxLines;
  final int maxLength;
  const PlainTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.validator,
    this.onChanged,
    this.onTap,
    this.icon = Icons.title,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.placeHolder,
    this.fontSize = 13,
    this.letterSpacing = 0,
    this.fontWeight = FontWeight.normal,
    this.enabled = true,
    this.maxWidth = 330,
    this.hintFontSize = 18,
    this.hintLetterSpacing = 0.5,
    this.hintFontWeight = FontWeight.normal,
    this.maxLines = 3,
    this.maxLength = 200,
  });

  @override
  State<PlainTextField> createState() => _PlainTextFieldState();
}

class _PlainTextFieldState extends State<PlainTextField> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: TextFormField(
        enabled: widget.enabled,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        keyboardAppearance: isDarkMode ? Brightness.dark : Brightness.light,
        textInputAction: widget.textInputAction,
        style: TextStyle(
          fontSize: widget.fontSize,
          letterSpacing: widget.letterSpacing,
          fontWeight: widget.fontWeight,
        ),
        minLines: 1,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          isDense: true,
          hintText: widget.placeHolder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
          hintStyle: TextStyle(
            fontSize: widget.hintFontSize,
            letterSpacing: widget.hintLetterSpacing,
            fontWeight: widget.hintFontWeight,
          ),
          counterStyle: TextStyle(
            height: widget.controller.text.isEmpty || !widget.focusNode.hasFocus
                ? 0
                : null,
            fontSize:
                widget.controller.text.isEmpty || !widget.focusNode.hasFocus
                    ? 0
                    : 10,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
          border: inputBorder("border", context),
          errorBorder: inputBorder("error", context),
          disabledBorder: inputBorder("disabled", context),
          enabledBorder: inputBorder("enabled", context),
          focusedBorder: inputBorder("focused", context),
          focusedErrorBorder: inputBorder("focusedError", context),
        ),
      ),
    );
  }
}
