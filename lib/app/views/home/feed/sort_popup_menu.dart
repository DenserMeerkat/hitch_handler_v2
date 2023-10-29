import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/providers/filter_provider.dart';
import 'package:hitch_handler_v2/app/types/sort_types.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';
import 'package:tinycolor2/tinycolor2.dart';

class SortPopupMenu extends StatefulWidget {
  final FilterProvider filterController;
  const SortPopupMenu({
    super.key,
    required this.filterController,
  });

  @override
  State<SortPopupMenu> createState() => _SortPopupMenuState();
}

class _SortPopupMenuState extends State<SortPopupMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<SortType> sortList = sortTypes;
    SortType sortType = getSortType(widget.filterController.filterSort);

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
        onSelected: (value) {
          _controller.reverse(from: 0.5);
          if (widget.filterController.filterSort != value) {
            widget.filterController.setFilterSort(value);
          }
        },
        onCanceled: () {
          _controller.reverse(from: 0.5);
        },
        onOpened: () {
          _controller.forward(from: 0.5);
        },
        itemBuilder: (context) => <PopupMenuEntry>[
          buildPopupMenuItem(context, widget.filterController, sortList[0]),
          buildPopupMenuItemDivider(context),
          buildPopupMenuItem(context, widget.filterController, sortList[1]),
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
              RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
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

PopupMenuItem<SortEnum> buildPopupMenuItem(
    BuildContext context, FilterProvider filterController, SortType sortType) {
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
