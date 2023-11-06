import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';

class PostProvider extends ChangeNotifier {
  String? _title;
  String? _description;
  late LocationEnum _location;
  late PostTypeEnum _type;
  late DomainEnum _domain;
  late bool _isLoading;
  late bool _useLocation;

  PostProvider() {
    _location = LocationEnum.none;
    _type = PostTypeEnum.public;
    _domain = DomainEnum.none;
    _isLoading = false;
    _useLocation = true;
  }

  String? get title => _title;
  String? get description => _description;
  LocationEnum get location => _location;
  PostTypeEnum get type => _type;
  DomainEnum get domain => _domain;
  bool get isLoading => _isLoading;
  bool get useLocation => _useLocation;

  void updateIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void updateTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void updateDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void updateLocation(LocationEnum location) {
    _location = location;
    notifyListeners();
  }

  void updateUseLocation(bool useLocation) {
    _useLocation = useLocation;
    notifyListeners();
  }

  void updateTypeEnum(PostTypeEnum type) {
    _type = type;
    notifyListeners();
  }

  void updateDomain(DomainEnum domain) {
    _domain = domain;
    notifyListeners();
  }
}
