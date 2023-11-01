import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';
import 'package:hitch_handler_v2/app/views/utils/utils.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tinycolor2/tinycolor2.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? placeHolder;
  final Function(String)? onChanged;
  final Function(String)? updateCountryCode;
  final Function()? onTap;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final double? fontSize;
  final double? letterSpacing;
  final bool? enabled;
  final bool showErrors;
  const PhoneField({
    super.key,
    required this.controller,
    this.validator,
    this.placeHolder = "Phone",
    this.onChanged,
    this.updateCountryCode,
    this.onTap,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.fontSize = 13,
    this.letterSpacing = 1,
    this.enabled = true,
    this.showErrors = true,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late Color shadowColor;
  late bool hasError = false;
  Country country = countries.firstWhere((element) => element.name == "India");

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      _onChange(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                  MaterialClip(
                    borderRadius: 24,
                    child: IntlPhoneField(
                      showCountryFlag: false,
                      dropdownIconPosition: IconPosition.trailing,
                      flagsButtonPadding: const EdgeInsets.only(left: 8),
                      flagsButtonMargin: const EdgeInsets.only(left: 48),
                      enabled: widget.enabled!,
                      initialCountryCode: "IN",
                      onCountryChanged: (value) {
                        setState(() {
                          country = value;
                        });
                        widget.updateCountryCode?.call(value.dialCode);
                      },
                      onTap: widget.onTap,
                      focusNode: widget.focusNode,
                      controller: widget.controller,
                      disableLengthCheck: true,
                      validator: (value) {
                        final String? res = widget.validator?.call(
                            '+${country.dialCode} ${widget.controller.text}');
                        if (mounted) {
                          setState(() {
                            hasError = res == null ? false : true;
                          });
                          if (widget.showErrors) _onChange(1);
                        }
                        return res;
                      },
                      onChanged: (value) {
                        final String? res = widget.validator?.call(
                            '+${country.dialCode} ${widget.controller.text}');
                        if (mounted) {
                          setState(() {
                            hasError = res == null ? false : true;
                          });
                          if (widget.showErrors) _onChange(1);
                        }
                      },
                      keyboardAppearance:
                          isDarkMode ? Brightness.dark : Brightness.light,
                      textInputAction: widget.textInputAction,
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        letterSpacing: widget.letterSpacing,
                      ),
                      pickerDialogStyle: PickerDialogStyle(
                        countryNameStyle: const TextStyle(fontSize: 12),
                        listTilePadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        listTileDivider: Container(
                          width: double.infinity,
                          height: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                        searchFieldInputDecoration: InputDecoration(
                          isDense: true,
                          hintText: "Search",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          contentPadding:
                              const EdgeInsets.fromLTRB(24, 10, 12, 16),
                          hintStyle: const TextStyle(
                            fontSize: 12.0,
                          ),
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: isDarkMode
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                          ),
                          border: inputBorder("border", context, radius: 16),
                          errorBorder:
                              inputBorder("error", context, radius: 16),
                          disabledBorder:
                              inputBorder("disabled", context, radius: 16),
                          enabledBorder:
                              inputBorder("enabled", context, radius: 16),
                          focusedBorder:
                              inputBorder("focused", context, radius: 16),
                          focusedErrorBorder:
                              inputBorder("focusedError", context, radius: 16),
                        ),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        isDense: true,
                        hintText: widget.placeHolder,
                        helperText: '_',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        contentPadding:
                            const EdgeInsets.fromLTRB(65, 10, 12, 16),
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
                        focusedErrorBorder:
                            inputBorder("focusedError", context),
                      ),
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
                          ? widget.validator!.call(
                                  '+${country.dialCode} ${widget.controller.text}') ??
                              ""
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
    if (!mounted) return;
    final bool isDarkMode = isDark(context);
    String string = '+${country.dialCode} ${widget.controller.text}';
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
