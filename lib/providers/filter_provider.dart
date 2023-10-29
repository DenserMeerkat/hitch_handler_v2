import 'package:hitch_handler_v2/app/types/sort_types.dart';
import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/data/enums/domain.dart';
import 'package:hitch_handler_v2/data/enums/location.dart';

class FilterProvider extends ChangeNotifier {
  DomainEnum filterDomain = DomainEnum.none;
  LocationEnum filterLocation = LocationEnum.none;
  SortEnum filterSort = SortEnum.latest;

  SortEnum get getfilterSort => filterSort;
  DomainEnum get geyfilterDomain => filterDomain;
  LocationEnum get geyfilterLocation => filterLocation;

  void setFilter(SortEnum sort, LocationEnum location, DomainEnum domain) {
    filterSort = sort;
    filterLocation = location;
    filterDomain = domain;
    notifyListeners();
  }

  void setFilterLocation(LocationEnum location) {
    filterLocation = location;
    notifyListeners();
  }

  void setFilterDomain(DomainEnum domain) {
    filterDomain = domain;
    notifyListeners();
  }

  void setFilterSort(SortEnum sort) {
    filterSort = sort;
    notifyListeners();
  }

  bool isLocationNone() {
    return filterLocation == LocationEnum.none;
  }

  bool isDomainNone() {
    return filterDomain == DomainEnum.none;
  }
}
