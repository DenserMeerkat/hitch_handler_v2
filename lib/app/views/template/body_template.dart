// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/utils/notifiers.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';

class BodyTemplate extends StatefulWidget {
  final Widget form;
  final Widget illustration;
  final double topSpacing;
  const BodyTemplate({
    super.key,
    required this.illustration,
    required this.form,
    this.topSpacing = 50,
  });

  @override
  State<BodyTemplate> createState() => _BodyTemplateState();
}

class _BodyTemplateState extends State<BodyTemplate> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          isLoading ? const LProgressIndicator() : Container(height: 3),
          Container(
            constraints: const BoxConstraints(maxWidth: 380),
            padding: EdgeInsets.only(
              left: 30.w,
              right: 30.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: widget.topSpacing.h,
                ),
                widget.illustration,
                SizedBox(
                  height: 20.h,
                ),
                NotificationListener<IsLoading>(
                  child: widget.form,
                  onNotification: (notification) {
                    setState(() {
                      isLoading = notification.isLoading;
                    });
                    return true;
                  },
                ),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
