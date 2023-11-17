import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/enums/enums.dart';

class AddPostProvider extends ChangeNotifier {
  String? _title;
  String? _description;
  late LocationEnum _location;
  late PostTypeEnum _type;
  late DomainEnum _domain;
  late bool _isLoading;
  late bool _useLocation;
  late bool _isEdited;

  AddPostProvider() {
    _location = LocationEnum.none;
    _type = PostTypeEnum.public;
    _domain = DomainEnum.none;
    _isLoading = false;
    _useLocation = true;
    _isEdited = false;
  }

  String? get title => _title;
  String? get description => _description;
  LocationEnum get location => _location;
  PostTypeEnum get type => _type;
  DomainEnum get domain => _domain;
  bool get isLoading => _isLoading;
  bool get useLocation => _useLocation;
  bool get isEdited => _isEdited;

  void updateIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void updateTitle(String title) {
    _title = title;
    updateIsEdited();
    notifyListeners();
  }

  void updateDescription(String description) {
    _description = description;
    updateIsEdited();
    notifyListeners();
  }

  void updateLocation(LocationEnum location) {
    _location = location;
    updateIsEdited();
    notifyListeners();
  }

  void updateUseLocation(bool useLocation) {
    _useLocation = useLocation;
    updateIsEdited();
    notifyListeners();
  }

  void updateTypeEnum(PostTypeEnum type) {
    _type = type;
    updateIsEdited();
    notifyListeners();
  }

  void updateDomain(DomainEnum domain) {
    _domain = domain;
    updateIsEdited();
    notifyListeners();
  }

  void updateIsEdited() {
    bool initValue = _isEdited;
    if (_title != null && _title!.isNotEmpty ||
        _description != null && _description!.isNotEmpty ||
        _location != LocationEnum.none ||
        _type != PostTypeEnum.public ||
        _domain != DomainEnum.none) {
      initValue = true;
    }
    if (initValue != _isEdited) {
      _isEdited = initValue;
      notifyListeners();
    }
  }
}
