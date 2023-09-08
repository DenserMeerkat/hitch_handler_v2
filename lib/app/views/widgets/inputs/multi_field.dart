import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/utils/inputs/field_functions.dart';
import 'package:hitch_handler_v2/app/utils/inputs/multi_field_types.dart';
import 'custom_field.dart';

class MultiField extends StatefulWidget {
  const MultiField({super.key});

  @override
  State<MultiField> createState() => _MultiFieldState();
}

class _MultiFieldState extends State<MultiField> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  List<FieldType> fields = MultiFields().list;
  int currentIndex = 0;
  late Widget suffix;
  late IconData _suffixIcon;
  @override
  void initState() {
    super.initState();
    controller.addListener(_onStateChange);
    focusNode.addListener(() {
      _onStateChange();
    });
    _suffixIcon = fields[currentIndex].suffixIcon;
    suffix = multiFieldButton(_suffixIcon, onTap);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _onStateChange() {
    if (controller.text.isNotEmpty && focusNode.hasFocus) {
      setState(() {
        suffix = clearButton(controller);
      });
    } else {
      setState(() {
        suffix = multiFieldButton(_suffixIcon, onTap);
      });
    }
  }

  void onTap() {
    setState(() {
      currentIndex = currentIndex == fields.length - 1 ? 0 : currentIndex + 1;
      _suffixIcon = fields[currentIndex].suffixIcon;
      suffix = multiFieldButton(_suffixIcon, onTap);
      controller.clear();
      focusNode.unfocus();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Future.delayed(const Duration(milliseconds: 500), () {
            focusNode.requestFocus();
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      controller: controller,
      validator: fields[currentIndex].validator,
      placeHolder: fields[currentIndex].placeHolder,
      keyboardType: fields[currentIndex].keyboardType,
      icon: Icons.account_circle,
      suffixIcon: suffix,
      focusNode: focusNode,
    );
  }
}
