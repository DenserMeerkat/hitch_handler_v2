import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/app/controllers/add_post_controller.dart';
import 'package:hitch_handler_v2/app/views/home/add/add_form.dart';
import 'package:hitch_handler_v2/app/views/home/add/type_popup_menu.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
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
    final AddPostController addPostController = AddPostController(context);
    final AddPostProvider addPostProvider = context.watch<AddPostProvider>();
    final bool useLocation = addPostProvider.useLocation;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SystemOverlayWrapper(
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            titleSpacing: 4,
            title: Row(
              children: [
                Icon(
                  MdiIcons.incognito,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  size: 18,
                ),
                const Gap(10),
                Text(
                  "Anonymous",
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
            leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CustomIconButton(
                tooltip: "Close",
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
                onPressed: !addPostProvider.isLoading
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : null,
              ),
            ),
            actions: [
              CustomIconButton(
                tooltip: "Info",
                icon: Icon(
                  Icons.help_outline_rounded,
                  size: 20,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
                onPressed: !addPostProvider.isLoading ? () {} : null,
              ),
              TypePopupMenu(
                addPostProvider: addPostProvider,
                enabled: !addPostProvider.isLoading,
                borderRadius: BorderRadius.circular(30),
                padding: const EdgeInsets.only(left: 10, right: 8),
              ),
              Gap(16.w),
            ],
            bottom: bottomLine(context),
          ),
          body: AddForm(
            showLocation: useLocation,
          ),
          bottomNavigationBar: Container(
            height: 66 + MediaQuery.of(context).padding.bottom,
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
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
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.1),
                      selectedColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      onPressed: !addPostProvider.isLoading
                          ? () {
                              addPostProvider.updateUseLocation(!useLocation);
                            }
                          : null,
                    ),
                    const Spacer(),
                    CustomFilledButton(
                      label: "Post",
                      onPressed: !addPostProvider.isLoading
                          ? () {
                              addPostController.post(context);
                            }
                          : null,
                      showIcon: true,
                      enabled: !addPostProvider.isLoading &&
                          addPostController.isFromValid(),
                    ),
                  ],
                ),
                Gap(MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
