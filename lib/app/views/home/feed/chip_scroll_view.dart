import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/feed/filter_chip_widget.dart';

class ChipsScrollView extends StatelessWidget {
  const ChipsScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: 360.w,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 15.w,
            ),
            FilterChipW(
              icon: Icons.domain,
              label: "Hostel & Mess",
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderColor: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(
              width: 10,
            ),
            FilterChipW(
              icon: Icons.location_on_outlined,
              label: "Ramanujam Computing Centre",
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 10,
            ),
            FilterChipW(
              icon: Icons.history_outlined,
              label: "Latest",
              color: Theme.of(context).colorScheme.primaryContainer,
              borderColor: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ),
    );
  }
}
