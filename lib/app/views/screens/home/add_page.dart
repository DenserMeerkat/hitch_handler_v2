import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/appbar_icon_button.dart';
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
        centerTitle: true,
        title: Text(
          "Add Post",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        leading: AppbarIconButton(
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
        bottom: bottomLine(context, height: 10),
      ),
      child: Container(
        height: 690.h,
      ),
    );
  }
}
