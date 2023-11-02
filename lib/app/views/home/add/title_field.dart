import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class TitleField extends StatefulWidget {
  const TitleField({super.key});

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  late PostProvider postProvider;

  @override
  void initState() {
    super.initState();
    postProvider = context.read<PostProvider>();
    if (postProvider.title?.isNotEmpty ?? false) {
      titleController.text = postProvider.title!;
      titleController.selection = TextSelection.fromPosition(
        TextPosition(offset: titleController.text.length),
      );
    }
    titleController.addListener(updateTitle);
  }

  void updateTitle() {
    postProvider.updateTitle(titleController.text);
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Title cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return PlainTextField(
      placeHolder: "Title",
      controller: titleController,
      focusNode: titleFocusNode,
      validator: titleValidator,
      textInputAction: TextInputAction.next,
      maxWidth: 360.w - 20,
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      hintFontSize: 24.sp,
      hintFontWeight: FontWeight.w600,
      maxLength: 60,
    );
  }
}
