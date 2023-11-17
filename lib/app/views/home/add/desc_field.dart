import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({super.key});

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final TextEditingController descController = TextEditingController();
  final FocusNode descFocusNode = FocusNode();
  late AddPostProvider addPostProvider;

  @override
  void initState() {
    super.initState();
    addPostProvider = context.read<AddPostProvider>();
    if (addPostProvider.description?.isNotEmpty ?? false) {
      descController.text = addPostProvider.description!;
      descController.selection = TextSelection.fromPosition(
        TextPosition(offset: descController.text.length),
      );
    }
    descController.addListener(updateDescription);
  }

  void updateDescription() {
    addPostProvider.updateDescription(descController.text);
  }

  String? descValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Title cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return PlainTextField(
      placeHolder: "Description",
      controller: descController,
      focusNode: descFocusNode,
      validator: descValidator,
      maxWidth: 360.w - 20,
      fontSize: 14.sp,
      hintFontSize: 14.sp,
      maxLines: 100,
      maxLength: 1000,
      enabled: !context.watch<AddPostProvider>().isLoading,
    );
  }
}
