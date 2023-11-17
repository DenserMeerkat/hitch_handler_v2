import 'package:flutter/material.dart';
import 'package:inner_drawer/inner_drawer.dart';

class IsLoading extends Notification {
  final bool isLoading;
  IsLoading(
    this.isLoading,
  );
}

class OpenDrawer extends Notification {
  final InnerDrawerDirection direction;
  OpenDrawer(
    this.direction,
  );
}
