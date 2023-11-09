import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/home/home_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/home/home_views.dart';
import 'package:hitch_handler_v2/app/views/screens/common/slider_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/app_leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/icon_button.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:inner_drawer/inner_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  late Color backgroundColor;
  int currentPageIndex = 0;
  bool isDrawerOpen = true;
  final viewList = HomeViews.homeViewList;
  final viewTitles = HomeViews.homeViewTitles;
  ValueNotifier<double> dragPosition = ValueNotifier(0);

  void onDestinationChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    backgroundColor = Theme.of(context).colorScheme.surface;
    super.didChangeDependencies();
  }

  Color calculateBackgroundColor(double dragPosition) {
    return Color.lerp(Theme.of(context).colorScheme.surface,
        Theme.of(context).colorScheme.onInverseSurface, dragPosition)!;
  }

  void closeDrawer() {
    _innerDrawerKey.currentState!.close();
  }

  @override
  Widget build(BuildContext context) {
    return SystemOverlayWrapper(
      child: WillPopScope(
        onWillPop: () async {
          if (isDrawerOpen) {
            _innerDrawerKey.currentState!.close();
            return false;
          }
          if (currentPageIndex != 0) {
            onDestinationChange(0);
          }
          return false;
        },
        child: InnerDrawer(
          key: _innerDrawerKey,
          swipe: true,
          swipeChild: true,
          onTapClose: true,
          offset: const IDOffset.horizontal(0.7),
          boxShadow: const [],
          colorTransitionChild: Colors.transparent,
          colorTransitionScaffold: Colors.transparent,
          backgroundDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface),
          onDragUpdate: (value, direction) {
            dragPosition.value = value;
          },
          innerDrawerCallback: (isOpened) {
            setState(() {
              isDrawerOpen = isOpened;
            });
          },
          rightChild: SliderPage(
            innerDrawerKey: _innerDrawerKey,
          ),
          leftChild: SliderPage(
            innerDrawerKey: _innerDrawerKey,
          ),
          scaffold: ValueListenableBuilder<double>(
            valueListenable: dragPosition,
            builder: (context, value, child) {
              return Container(
                color: calculateBackgroundColor(value),
                child: child,
              );
            },
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
                          _innerDrawerKey.currentState!
                              .toggle(direction: InnerDrawerDirection.end);
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
    );
  }
}
