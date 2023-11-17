import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/home/add/desc_field.dart';
import 'package:hitch_handler_v2/app/views/home/add/domain_field.dart';
import 'package:hitch_handler_v2/app/views/home/add/location_field.dart';
import 'package:hitch_handler_v2/app/views/home/add/title_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/linear_progress_indicator.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class AddForm extends StatefulWidget {
  final bool showLocation;
  const AddForm({
    super.key,
    required this.showLocation,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AddPostProvider>().isLoading;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            isLoading ? const LProgressIndicator() : Container(height: 3),
            Gap(16.h),
            const DomainField(),
            if (widget.showLocation) const LocationField(),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Gap(24.h),
            const TitleField(),
            Gap(8.h),
            const DescriptionField(),
            Gap(24.h),
          ],
        ),
      ),
    );
  }
}
