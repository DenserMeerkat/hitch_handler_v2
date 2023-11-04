import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';

class PlainTypeAheadField extends StatefulWidget {
  final void Function(dynamic) onSuggestionSelected;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final Future<List<dynamic>> Function(String) suggestionsCallback;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? placeHolder;
  final IconData? icon;
  final IconData? noItemFoundIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;
  final bool enabled;
  final AxisDirection? direction;
  final double maxWidth;
  final int minCharsForSuggestions;
  const PlainTypeAheadField({
    super.key,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    required this.suggestionsCallback,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.onTap,
    this.icon = Icons.title,
    this.noItemFoundIcon = Icons.block_outlined,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.placeHolder,
    this.fontSize = 13,
    this.letterSpacing = 0,
    this.fontWeight = FontWeight.normal,
    this.enabled = true,
    this.direction,
    this.maxWidth = 330,
    this.minCharsForSuggestions = 1,
  });

  @override
  State<PlainTypeAheadField> createState() => _PlainTypeAheadFieldState();
}

class _PlainTypeAheadFieldState extends State<PlainTypeAheadField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: TypeAheadFormField(
        ignoreAccessibleNavigation: true,
        suggestionsBoxVerticalOffset: 0,
        minCharsForSuggestions: widget.minCharsForSuggestions,
        hideSuggestionsOnKeyboardHide: true,
        direction: AxisDirection.down,
        onSuggestionSelected: widget.onSuggestionSelected,
        suggestionsCallback: widget.suggestionsCallback,
        noItemsFoundBuilder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  widget.noItemFoundIcon,
                  size: 16,
                ),
                const Gap(16),
                const Text(
                  "No items found",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
        itemBuilder: (context, dynamic suggestion) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  widget.icon,
                  size: 16,
                ),
                const Gap(16),
                Text(
                  suggestion.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          hasScrollbar: false,
          constraints: BoxConstraints(maxWidth: widget.maxWidth),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          ),
          clipBehavior: Clip.hardEdge,
          color: Theme.of(context).colorScheme.surface,
        ),
        textFieldConfiguration: TextFieldConfiguration(
          enabled: widget.enabled,
          onTap: widget.onTap,
          focusNode: widget.focusNode,
          controller: widget.controller,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          keyboardAppearance: isDarkMode ? Brightness.dark : Brightness.light,
          textInputAction: widget.textInputAction,
          style: TextStyle(
            fontSize: widget.fontSize,
            letterSpacing: widget.letterSpacing,
            fontWeight: widget.fontWeight,
          ),
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            isDense: true,
            hintText: widget.placeHolder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
            hintStyle: const TextStyle(
              fontSize: 15.0,
              letterSpacing: 0.5,
            ),
            prefixIcon: Icon(
              widget.icon,
              size: 18,
            ),
            suffixIcon: MaterialClip(
              borderRadius: 50,
              child: widget.controller.text.isNotEmpty &&
                      widget.focusNode.hasFocus &&
                      widget.enabled
                  ? InkWell(
                      onTap: () {
                        widget.controller.clear();
                      },
                      child: const Icon(
                        Icons.clear_rounded,
                        size: 18,
                      ),
                    )
                  : widget.suffixIcon,
            ),
            border: inputBorder("border", context),
            errorBorder: inputBorder("error", context),
            disabledBorder: inputBorder("disabled", context),
            enabledBorder: inputBorder("enabled", context),
            focusedBorder: inputBorder("focused", context),
            focusedErrorBorder: inputBorder("focusedError", context),
          ),
        ),
      ),
    );
  }
}
