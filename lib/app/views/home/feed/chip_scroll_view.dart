import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/home/feed/filter_chip_widget.dart';
import 'package:hitch_handler_v2/data/enums/domain.dart';
import 'package:hitch_handler_v2/data/enums/location.dart';
import 'package:hitch_handler_v2/theme/color_enum.dart';
import 'package:provider/provider.dart';

class ChipsScrollView extends StatelessWidget {
  const ChipsScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FilterProvider filterController = context.watch<FilterProvider>();
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
            !filterController.isDomainNone()
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChipW(
                      icon: Icons.domain,
                      label:
                          Domain.getDomainString(filterController.filterDomain),
                      colorEnum: ColorEnum.tertiary,
                    ),
                  )
                : const SizedBox(),
            !filterController.isLocationNone()
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChipW(
                      icon: Icons.location_on_outlined,
                      label: Location.getLocationString(
                          filterController.filterLocation),
                      colorEnum: ColorEnum.secondary,
                    ),
                  )
                : const SizedBox(),
            FilterChipW(
              icon: getSortType(filterController.filterSort).icon,
              label: getSortType(filterController.filterSort).title,
              colorEnum: ColorEnum.primary,
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
