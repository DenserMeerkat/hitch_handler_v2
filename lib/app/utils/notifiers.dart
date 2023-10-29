import 'package:flutter/material.dart';

class IsLoading extends Notification {
  final bool isLoading;
  IsLoading(
    this.isLoading,
  );
}

class IsPhone extends Notification {
  final bool isPhone;
  final String countryCode;
  IsPhone(
    this.isPhone,
    this.countryCode,
  );
}
