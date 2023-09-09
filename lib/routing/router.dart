import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/screens/index.dart';
import 'package:hitch_handler_v2/app/views/screens/theme_settings_page.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/system_overlay_wrapper.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SystemOverlayWrapper(child: AppPage());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'themesettings',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SystemOverlayWrapper(child: SettingsPage()),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeInOut)),
                  ),
                  child: child,
                );
              },
            );
          },
          builder: (BuildContext context, GoRouterState state) {
            return const SystemOverlayWrapper(child: SettingsPage());
          },
        ),
      ],
    ),
  ],
);
