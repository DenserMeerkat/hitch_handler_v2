import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/views/home/home_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/screens/common/account_page.dart';
import 'package:hitch_handler_v2/app/views/screens/common/slider_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/buttons/buttons.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/overlay_wrapper.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:inner_drawer/inner_drawer.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

class HomePage extends StatefulWidget {
  final List<Widget> viewList;
  final List<Widget> viewTitles;
  final int currentIndex;
  const HomePage({
    required Key key,
    required this.viewList,
    required this.viewTitles,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  late Color backgroundColor;
  int currentPageIndex = 0;
  bool isDrawerOpen = true;
  ValueNotifier<double> dragPosition = ValueNotifier(0);

  void onDestinationChange(int index) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
    bool isAmoled = context.watch<ThemeProvider>().trueDark;
    ThemeMode selectedThemeMode =
        context.read<ThemeProvider>().selectedThemeMode;
    Color start = Theme.of(context).colorScheme.surface;
    Color end = selectedThemeMode == ThemeMode.light
        ? Theme.of(context).colorScheme.surfaceVariant
        : isAmoled
            ? Theme.of(context)
                .colorScheme
                .surface
                .mix(Theme.of(context).colorScheme.primary, 5)
            : Theme.of(context).colorScheme.onInverseSurface;
    return Color.lerp(start, end, dragPosition)!;
  }

  void closeDrawer() {
    _innerDrawerKey.currentState!.close();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.read<UserProvider>();
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
          rightChild: AccountPage(
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
                    titleSpacing: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CustomIconButton(
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
                              .open(direction: InnerDrawerDirection.start);
                        },
                      ),
                    ),
                    actions: [
                      CustomIconButton(
                        tooltip: "Account",
                        icon: Icon(
                          Icons.account_circle_outlined,
                          size: 20,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8),
                        ),
                        onPressed: () {
                          _innerDrawerKey.currentState!
                              .open(direction: InnerDrawerDirection.end);
                        },
                      )
                    ],
                    title: widget.viewTitles[currentPageIndex],
                    bottom: bottomLine(context),
                  ),
                  body: widget.viewList[currentPageIndex],
                  bottomNavigationBar: HomeBottomBar(
                    key: ValueKey("${widget.key}BottomBar"),
                    currentPageIndex: currentPageIndex,
                    onDestinationChange: onDestinationChange,
                    isAdmin: userProvider.userModel!.userType == UserEnum.admin,
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
