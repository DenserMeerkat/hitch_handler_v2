import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/home_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/screens/common/slider_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  int currentPageIndex = 0;

  final viewList = HomeViews.homeViewList;
  final viewTitles = HomeViews.homeViewTitles;

  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SystemOverlayWrapper(
      child: Scaffold(
        body: SliderDrawer(
          key: _sliderDrawerKey,
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
          appBar: AppBar(
            primary: true,
            scrolledUnderElevation: 0,
            centerTitle: true,
            elevation: 0,
            leading: LeadingWidget(
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                ),
                child: const Text(
                  "HH",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            actions: [
              LeadingWidget(
                icon: Icon(
                  Symbols.side_navigation_rounded,
                  size: 20,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
                onPressed: () {
                  _sliderDrawerKey.currentState!.toggle();
                },
              )
            ],
            title: Text(
              viewTitles[currentPageIndex],
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
          sliderOpenSize: 300.w,
          slider: SliderPage(sliderDrawerKey: _sliderDrawerKey),
          animationDuration: 300,
          child: GestureDetector(
            onTap: () {
              if (_sliderDrawerKey.currentState!.isDrawerOpen) {
                _sliderDrawerKey.currentState!.closeSlider();
              }
            },
            onHorizontalDragEnd: (dragDetail) {
              if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
                _sliderDrawerKey.currentState?.openSlider();
              } else {
                _sliderDrawerKey.currentState?.closeSlider();
              }
            },
            child: Scaffold(
              body: viewList[currentPageIndex],
              bottomNavigationBar: HomeBottomBar(
                currentPageIndex: currentPageIndex,
                onDestinationChange: onDestinationChange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
