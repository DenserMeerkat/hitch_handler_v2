import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/user/admin_home.dart';
import 'package:hitch_handler_v2/app/views/screens/auth/auth_page.dart';
import 'package:hitch_handler_v2/app/views/screens/auth/create_pass_page.dart';
import 'package:hitch_handler_v2/app/views/screens/auth/otp_page.dart';
import 'package:hitch_handler_v2/app/views/screens/auth/reset_pass_page.dart';
import 'package:hitch_handler_v2/app/views/screens/common/search_page.dart';
import 'package:hitch_handler_v2/app/views/screens/common/settings_page.dart';
import 'package:hitch_handler_v2/app/views/screens/home/add_page.dart';
import 'package:hitch_handler_v2/app/views/user/student_home.dart';
import 'package:hitch_handler_v2/data/enums/user.dart';
import 'package:hitch_handler_v2/providers/user_provider.dart';
import 'package:provider/provider.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthPage();
      },
      redirect: (context, state) {
        final userValue = context.read<UserProvider>();
        if (userValue.jwtToken != null && userValue.userModel != null) {
          if (userValue.userModel?.userType == UserEnum.admin) {
            return "/student";
          }
          return "/student";
        }
        return null;
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
      ],
    ),
    GoRoute(
      path: '/student',
      builder: (BuildContext context, GoRouterState state) {
        return const StudentHomePage();
      },
      redirect: (context, state) {
        final userValue = context.read<UserProvider>();
        if (userValue.jwtToken == null && userValue.userModel == null) {
          return "/";
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'search',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const SearchPage(),
            );
          },
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
          },
        ),
        GoRoute(
          path: 'add',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AddPage(),
              fullscreenDialog: true,
              transitionDuration: const Duration(milliseconds: 500),
              reverseTransitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeInOut)),
                  ),
                  child: child,
                );
              },
            );
          },
          builder: (BuildContext context, GoRouterState state) {
            return const AddPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/admin',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminHomePage();
      },
      redirect: (context, state) {
        final userValue = context.read<UserProvider>();
        if (userValue.jwtToken == null && userValue.userModel == null) {
          return "/";
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'search',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const SearchPage(),
            );
          },
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
          },
        ),
      ],
    ),
  ],
);
