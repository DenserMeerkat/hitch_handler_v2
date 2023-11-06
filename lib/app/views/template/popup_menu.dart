import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';
import 'package:tinycolor2/tinycolor2.dart';

abstract class AbstractPopupMenu<T, E> extends StatefulWidget {
  final double dividerHeight;
  final BorderRadiusGeometry? buttonBorderRadius;
  final EdgeInsetsGeometry? buttonPadding;
  final bool isEnabled;
  final bool showTitle;
  const AbstractPopupMenu({
    Key? key,
    this.dividerHeight = 34,
    this.buttonBorderRadius,
    this.buttonPadding,
    this.isEnabled = true,
    this.showTitle = false,
  }) : super(key: key);

  void updateSelectedItem(E itemEnum);

  List<T> getItems();

  T getSelectedItem();

  IconData getIconData(E itemEnum);

  String getItemTitle(E itemEnum);

  E getNoneValue();

  E getEnum(T item);

  @override
  State<AbstractPopupMenu<T, E>> createState() =>
      _AbstractPopupMenuState<T, E>();
}

class _AbstractPopupMenuState<T, E> extends State<AbstractPopupMenu<T, E>>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late List<T> itemList;
  late T selectedItem;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    itemList = widget.getItems();
    selectedItem = widget.getSelectedItem();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedItem = widget.getSelectedItem();
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AbsorbPointer(
      absorbing: !widget.isEnabled,
      child: MaterialClip1(
        borderRadius: widget.buttonBorderRadius ?? BorderRadius.circular(12),
        child: PopupMenuButton(
          offset: const Offset(0, 16),
          position: PopupMenuPosition.under,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          color: Theme.of(context).colorScheme.background.mix(
                Theme.of(context).colorScheme.tertiaryContainer,
                isDarkMode ? 40 : 80,
              ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (value) {
            _controller.reverse(from: 0.5);
            if (selectedItem != value) {
              widget.updateSelectedItem(value);
            }
          },
          onCanceled: () {
            _controller.reverse(from: 0.5);
          },
          onOpened: () {
            _controller.forward(from: 0.5);
          },
          itemBuilder: (context) {
            final items = itemList.toList();
            final itemsWithDividers = <PopupMenuEntry<E>>[];

            for (var i = 0; i < items.length; i++) {
              itemsWithDividers
                  .add(buildPopupMenuItem(context, widget.getEnum(items[i])));

              // Add a divider after each element except the last one
              if (i < items.length - 1) {
                itemsWithDividers.add(buildPopupMenuItemDivider(context));
              }
            }

            return itemsWithDividers;
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(isDarkMode ? 0.6 : 1),
              borderRadius:
                  widget.buttonBorderRadius ?? BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: widget.buttonPadding ??
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Icon(widget.getIconData(widget.getEnum(selectedItem)),
                      size: 20),
                ),
                if (widget.showTitle)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.getItemTitle(widget.getEnum(selectedItem)),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                Container(
                  height: widget.dividerHeight,
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
      ),
    );
  }

  PopupMenuItem<E> buildPopupMenuItem(BuildContext context, E itemEnum) {
    return PopupMenuItem<E>(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      onTap: () {
        if (selectedItem != itemEnum) {
          widget.updateSelectedItem(itemEnum);
        }
      },
      value: itemEnum,
      child: Row(
        children: [
          Icon(widget.getIconData(itemEnum), size: 16),
          const Gap(8),
          Text(widget.getItemTitle(itemEnum)),
        ],
      ),
    );
  }

  PopupMenuItem<E> buildPopupMenuItemDivider(BuildContext context) {
    return PopupMenuItem(
      padding: EdgeInsets.zero,
      height: 1,
      onTap: null,
      value: widget.getNoneValue(),
      child: Container(
        height: 1,
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
