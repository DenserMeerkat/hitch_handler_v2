import 'package:flutter/material.dart';

class AuthTabType {
  final String title;
  final IconData icon;
  const AuthTabType({
    required this.title,
    required this.icon,
  });
}

final List<AuthTabType> authTabs = <AuthTabType>[
  const AuthTabType(
    title: "Sign In",
    icon: Icons.person,
  ),
  const AuthTabType(
    title: "Sign Up",
    icon: Icons.person_add,
  ),
];
