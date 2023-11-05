import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/home_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/screens/common/slider_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/app_leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/icon_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  int currentPageIndex = 0;
  bool isDrawerOpen = false;

  final viewList = HomeViews.homeViewList;
  final viewTitles = HomeViews.homeViewTitles;

  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    zoomDrawerController.stateNotifier = ValueNotifier(DrawerState.closed);
  }

  @override
  void dispose() {
    zoomDrawerController.stateNotifier!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SystemOverlayWrapper(
      child: WillPopScope(
        onWillPop: () async {
          if (zoomDrawerController.isOpen!()) {
            zoomDrawerController.close!();
          } else if (currentPageIndex != 0) {
            onDestinationChange(0);
          }
          return false;
        },
        child: ZoomDrawer(
          controller: zoomDrawerController,
          shrinkMainScreen: false,
          angle: 0,
          menuScreenWidth: 300.w,
          mainScreenScale: 0,
          slideWidth: 300.w,
          isRtl: true,
          borderRadius: 0,
          mainScreenTapClose: true,
          menuScreen: SliderPage(
            zoomDrawerController: zoomDrawerController,
          ),
          mainScreen: GestureDetector(
            onHorizontalDragEnd: (dragDetail) {
              if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
                zoomDrawerController.open!();
              } else {
                zoomDrawerController.close!();
              }
            },
            child: ValueListenableBuilder(
              valueListenable: zoomDrawerController.stateNotifier!,
              builder: (context, value, child) => Container(
                color: value == DrawerState.open
                    ? Theme.of(context).colorScheme.onInverseSurface
                    : Theme.of(context).colorScheme.surface,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: SafeArea(
                    bottom: false,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        primary: true,
                        scrolledUnderElevation: 0,
                        centerTitle: true,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
                        ),
                        leading: const AppLeadingWidget(),
                        actions: [
                          CustomIconButton(
                            tooltip: "Toggle Sidebar",
                            icon: Icon(
                              Symbols.side_navigation_rounded,
                              size: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.8),
                            ),
                            onPressed: () {
                              zoomDrawerController.toggle!();
                            },
                          )
                        ],
                        title: Text(
                          viewTitles[currentPageIndex],
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                      body: viewList[currentPageIndex],
                      bottomNavigationBar: HomeBottomBar(
                        currentPageIndex: currentPageIndex,
                        onDestinationChange: onDestinationChange,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
