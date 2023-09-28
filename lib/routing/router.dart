import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/screens/auth_page.dart';
import 'package:hitch_handler_v2/app/views/screens/create_pass_page.dart';
import 'package:hitch_handler_v2/app/views/screens/otp_page.dart';
import 'package:hitch_handler_v2/app/views/screens/reset_pass_page.dart';
import 'package:hitch_handler_v2/app/views/screens/settings_page.dart';
import 'package:hitch_handler_v2/app/views/screens/user_home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'settings',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SettingsPage(),
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
            return const SettingsPage();
          },
        ),
        GoRoute(
          path: 'otp/:contact',
          builder: (BuildContext context, GoRouterState state) {
            final contact = state.pathParameters['contact']!;
            return OtpPage(contact: contact);
          },
        ),
        GoRoute(
          path: 'reset-pass',
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordPage();
          },
        ),
        GoRoute(
          path: 'create-pass',
          builder: (BuildContext context, GoRouterState state) {
            return const CreatePasswordPage();
          },
        ),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
            routes: [
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const SettingsPage(),
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
                  return const SettingsPage();
                },
              ),
            ]),
      ],
    ),
  ],
);
