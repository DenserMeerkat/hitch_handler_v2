import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/controllers/filter_controller.dart';
import 'package:hitch_handler_v2/app/types/sort_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';
import 'package:tinycolor2/tinycolor2.dart';

class SortPopupMenu extends StatelessWidget {
  final FilterController filterController;
  const SortPopupMenu({
    super.key,
    required this.filterController,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<SortType> sortList = sortTypes;
    SortType sortType = getSortType(filterController.filterSort);
    return MaterialClip(
      child: PopupMenuButton(
        offset: const Offset(0, 16),
        position: PopupMenuPosition.under,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        color: Theme.of(context).colorScheme.background.mix(
            Theme.of(context).colorScheme.tertiaryContainer,
            isDarkMode ? 40 : 80),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        splashRadius: 8,
        itemBuilder: (context) => <PopupMenuEntry>[
          buildPopupMenuItem(context, filterController, sortList[0]),
          buildPopupMenuItemDivider(context),
          buildPopupMenuItem(context, filterController, sortList[1]),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .tertiaryContainer
                .withOpacity(isDarkMode ? 0.6 : 1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
              width: 0.1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                child: Icon(sortType.icon, size: 20),
              ),
              Container(
                height: 34,
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PopupMenuItem<SortEnum> buildPopupMenuItemDivider(BuildContext context) {
  return PopupMenuItem<SortEnum>(
      padding: EdgeInsets.zero,
      height: 1,
      onTap: null,
      value: SortEnum.none,
      child: Container(
        height: 1,
        color: Theme.of(context).dividerColor,
      ));
}

PopupMenuItem<SortEnum> buildPopupMenuItem(BuildContext context,
    FilterController filterController, SortType sortType) {
  return PopupMenuItem<SortEnum>(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    height: 36,
    onTap: () {
      if (filterController.filterSort != sortType.sortEnum) {
        filterController.setFilterSort(sortType.sortEnum);
      }
    },
    value: sortType.sortEnum,
    child: Row(
      children: [
        Icon(sortType.icon, size: 16),
        const SizedBox(width: 8),
        Text(sortType.title),
      ],
    ),
  );
}
