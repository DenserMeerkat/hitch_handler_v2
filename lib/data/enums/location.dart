enum LocationEnum {
  none,
  redbuilding,
  kp,
  rcc,
  library,
  cegCanteen,
  actCanteen,
}

class Location {
  static Map<String, LocationEnum> locations = {
    "Red Building": LocationEnum.redbuilding,
    "Knowledge Park": LocationEnum.kp,
    "Ramanujam Computing Centre": LocationEnum.rcc,
    "University Library": LocationEnum.library,
    "CEG Canteen": LocationEnum.cegCanteen,
    "ACT Canteen": LocationEnum.actCanteen,
  };

  static LocationEnum getLocationEnum(String location) {
    return locations[location] ?? LocationEnum.none;
  }

  static String getLocationString(LocationEnum location) {
    return locations.keys.firstWhere(
      (element) => locations[element] == location,
      orElse: () => "",
    );
  }

  static List<String> getLocationSuggestion(String pattern) {
    return locations.keys
        .where(
          (element) => element.toLowerCase().contains(pattern.toLowerCase()),
        )
        .toList();
  }
}
