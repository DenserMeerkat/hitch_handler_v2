import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/add/add_form.dart';
import 'package:hitch_handler_v2/app/views/home/add/type_popup_menu.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [TypePopupMenu()],
        ),
        leading: CustomIconButton(
          tooltip: "Close",
          icon: Icon(
            Icons.close,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          CustomFilledButton(
            onPressed: () {},
            label: "Next",
          ),
          SizedBox(width: 16.w),
        ],
        bottom: bottomLine(context),
      ),
      body: const AddForm(),
    );
  }
}
