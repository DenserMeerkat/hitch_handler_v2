import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/material_clip.dart';
import 'package:hitch_handler_v2/providers/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

class TypePopupMenu extends StatefulWidget {
  final double borderRadius;
  final double popupMenuRadius;
  final bool showTitle;
  const TypePopupMenu({
    super.key,
    this.borderRadius = 20,
    this.popupMenuRadius = 8,
    this.showTitle = false,
  });

  @override
  State<TypePopupMenu> createState() => _TypePopupMenuState();
}

class _TypePopupMenuState extends State<TypePopupMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late PostProvider postProvider;
  late List<PostType> postTypeList;
  late PostType postType;
  late PostTypeEnum postTypeEnum;

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
    postProvider = context.watch<PostProvider>();
    postTypeList = postTypes;
    postType = postProvider.type;
    postTypeEnum = postType.postTypeEnum;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MaterialClip(
      borderRadius: widget.borderRadius,
      child: PopupMenuButton(
        offset: const Offset(0, 20),
        position: PopupMenuPosition.under,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        color: Theme.of(context).colorScheme.background.mix(
            Theme.of(context).colorScheme.tertiaryContainer,
            isDarkMode ? 40 : 80),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(widget.popupMenuRadius),
        ),
        splashRadius: 8,
        onSelected: (value) {
          _controller.reverse(from: 0.5);
          postProvider.updateType(getPostType(value));
        },
        onCanceled: () {
          _controller.reverse(from: 0.5);
        },
        onOpened: () {
          _controller.forward(from: 0.5);
        },
        itemBuilder: (context) => <PopupMenuEntry>[
          buildPopupMenuItem(context, postProvider, postTypeList[0]),
          buildPopupMenuItemDivider(context),
          buildPopupMenuItem(context, postProvider, postTypeList[1]),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .tertiaryContainer
                .withOpacity(isDarkMode ? 0.6 : 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(postType.icon, size: widget.showTitle ? 20 : 18),
              ),
              Container(
                height: widget.showTitle ? 34 : 30,
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
              widget.showTitle
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        postType.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : const Gap(0),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const Gap(4)
            ],
          ),
        ),
      ),
    );
  }
}

PopupMenuItem buildPopupMenuItemDivider(BuildContext context) {
  return PopupMenuItem(
    padding: EdgeInsets.zero,
    height: 1,
    onTap: null,
    value: SortEnum.none,
    child: Container(
      height: 1,
      color: Theme.of(context).dividerColor,
    ),
  );
}

PopupMenuItem<PostTypeEnum> buildPopupMenuItem(
    BuildContext context, PostProvider postProvider, PostType postType) {
  return PopupMenuItem<PostTypeEnum>(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    height: 36,
    onTap: () {
      if (postProvider.type.postTypeEnum != postType.postTypeEnum) {
        postProvider.updateType(postType);
      }
    },
    value: postType.postTypeEnum,
    child: Row(
      children: [
        Icon(postType.icon, size: 16),
        const Gap(8),
        Text(postType.title),
      ],
    ),
  );
}
