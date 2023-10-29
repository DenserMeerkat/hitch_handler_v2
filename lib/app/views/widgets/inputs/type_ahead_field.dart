import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hitch_handler_v2/app/views/utils/input_utils.dart';
import 'package:hitch_handler_v2/theme/color_enum.dart';

class CustomTypeAheadField extends StatefulWidget {
  final void Function(dynamic) onSuggestionSelected;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final Future<List<dynamic>> Function(String) suggestionsCallback;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? placeHolder;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final double? fontSize;
  final double? letterSpacing;
  final bool? enabled;
  final AxisDirection? direction;
  final ColorEnum? colorEnum;
  const CustomTypeAheadField({
    super.key,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    required this.suggestionsCallback,
    this.controller,
    this.onChanged,
    this.onTap,
    this.icon = Icons.title,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.placeHolder,
    this.fontSize = 13,
    this.letterSpacing = 1,
    this.enabled,
    this.direction,
    this.colorEnum = ColorEnum.secondary,
  });

  @override
  State<CustomTypeAheadField> createState() => _CustomTypeAheadFieldState();
}

class _CustomTypeAheadFieldState extends State<CustomTypeAheadField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
    widget.focusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    ColorFamily colorFamily = getColorFamily(widget.colorEnum!, context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 42,
                decoration: BoxDecoration(
                  color: colorFamily.colorContainer
                      .withOpacity(isDarkMode ? 0.4 : 0.8),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.2,
                  ),
                ),
              ),
              TypeAheadFormField(
                minCharsForSuggestions: 1,
                hideOnEmpty: true,
                hideSuggestionsOnKeyboardHide: true,
                direction: widget.direction ?? AxisDirection.up,
                onSuggestionSelected: widget.onSuggestionSelected,
                suggestionsCallback: widget.suggestionsCallback,
                itemBuilder: (context, dynamic suggestion) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12),
                    decoration: BoxDecoration(
                      color: colorFamily.colorContainer
                          .withOpacity(isDarkMode ? 0.4 : 0.8),
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          suggestion.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.label_important_outline_rounded,
                          color: colorFamily.onColorContainer,
                          size: 16,
                        ),
                      ],
                    ),
                  );
                },
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  hasScrollbar: false,
                  offsetX: 40,
                  constraints: const BoxConstraints(maxWidth: 240),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  color: Theme.of(context).colorScheme.surface,
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  enabled: widget.enabled ?? true,
                  onTap: widget.onTap,
                  onEditingComplete: () {
                    widget.focusNode?.unfocus();
                  },
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  keyboardAppearance:
                      isDarkMode ? Brightness.dark : Brightness.light,
                  textInputAction: widget.textInputAction,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    letterSpacing: widget.letterSpacing,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    isDense: true,
                    hintText: widget.placeHolder,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    contentPadding: const EdgeInsets.fromLTRB(58, 6, 8, 16),
                    hintStyle: const TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1,
                    ),
                    suffixIcon: widget.suffixIcon ??
                        GestureDetector(
                          onTap: () {
                            widget.controller?.clear();
                          },
                          child: Icon(
                            Icons.clear_rounded,
                            color: colorFamily.onColorContainer,
                            size: 18,
                          ),
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
              Container(
                margin: const EdgeInsets.only(left: 1),
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorFamily.colorContainer
                      .withOpacity(isDarkMode ? 0.6 : 1),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(7),
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: colorFamily.onColorContainer,
                  size: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 41),
                height: 40,
                width: 2,
                color: Theme.of(context).dividerColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
