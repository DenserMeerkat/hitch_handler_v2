import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/controllers/post_controller.dart';
import 'package:hitch_handler_v2/app/views/home/add/add_form.dart';
import 'package:hitch_handler_v2/app/views/home/add/type_popup_menu.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final PostController postController = PostController(context);
    final PostProvider postProvider = context.read<PostProvider>();
    final bool useLocation = context.watch<PostProvider>().useLocation;
    return AppWrapper(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 4,
        title: Row(
          children: [
            Icon(
              MdiIcons.incognito,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              size: 18,
            ),
            const Gap(10),
            Text(
              "Anonymous",
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ],
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
          CustomIconButton(
            tooltip: "Info",
            icon: Icon(
              Icons.help_outline_rounded,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
            onPressed: () {},
          ),
          const TypePopupMenu(),
          Gap(16.w),
        ],
        bottom: bottomLine(context),
      ),
      body: AddForm(
        showLocation: useLocation,
      ),
      bottomNavigationBar: Container(
        height: 81,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconToggleButton(
                  verticalOffset: 40,
                  borderRadius: 12,
                  selectedIcon: Icons.place_outlined,
                  icon: Icons.wrong_location_outlined,
                  isSelected: useLocation,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                  selectedColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  onPressed: !postProvider.isLoading
                      ? () {
                          postProvider.updateUseLocation(!useLocation);
                        }
                      : null,
                ),
                const Spacer(),
                CustomFilledButton(
                  label: "Post",
                  onPressed: () {},
                  showIcon: true,
                  enabled:
                      !postProvider.isLoading && postController.isFromValid(),
                ),
              ],
            ),
            Gap(MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
