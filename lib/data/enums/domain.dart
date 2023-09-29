enum DomainEnum {
  none,
  administration,
  examination,
  sanitaion,
  hostel,
  mess,
  wifi,
  placement,
  ammenities,
  admission,
}

class Domain {
  static Map<String, DomainEnum> domains = {
    "Administration": DomainEnum.administration,
    "Examination": DomainEnum.examination,
    "Sanitation": DomainEnum.sanitaion,
    "Hostel": DomainEnum.hostel,
    "Mess": DomainEnum.mess,
    "Wifi": DomainEnum.wifi,
    "Placement": DomainEnum.placement,
    "Ammenities": DomainEnum.ammenities,
    "Admission": DomainEnum.admission,
  };

  static DomainEnum getDomainEnum(String domain) {
    return domains[domain] ?? DomainEnum.none;
  }

  static String getDomainString(DomainEnum domain) {
    return domains.keys.firstWhere(
      (element) => domains[element] == domain,
      orElse: () => "none",
    );
  }

  static List<String> getDomainSuggestion(String pattern) {
    return domains.keys
        .where(
          (element) => element.toLowerCase().contains(pattern.toLowerCase()),
        )
        .toList();
  }
}
