import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:hitch_handler_v2/app/types/types.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/app/views/widgets/modals/modals.dart';
import 'package:hitch_handler_v2/data/enums/domain.dart';
import 'package:hitch_handler_v2/data/enums/location.dart';
import 'package:hitch_handler_v2/theme/color_enum.dart';
import 'package:provider/provider.dart';

void showFilterSheet(BuildContext context) {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

  showCustomModalBottomSheet(
    context,
    const FilterSheet(),
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
  );
}

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final TextEditingController domainController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final FocusNode domainFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();

  final List<SortType> _sortTypes = sortTypes;

  late FilterProvider filterController;

  late SortEnum selectedSort;
  late LocationEnum selectedLocation;
  late DomainEnum selectedDomain;

  late Widget locationSuffixIcon = getSuffixIcon(Icons.question_mark_outlined);
  late Widget domainSuffixIcon = getSuffixIcon(Icons.question_mark_outlined);

  @override
  void initState() {
    super.initState();
    filterController = Provider.of(context, listen: false);

    locationSuffixIcon = getSuffixIcon(Icons.question_mark_outlined);
    domainSuffixIcon = getSuffixIcon(Icons.question_mark_outlined);

    selectedSort = filterController.filterSort;
    selectedLocation = filterController.filterLocation;
    selectedDomain = filterController.filterDomain;

    domainController.addListener(() {
      setDomainIcon();
    });
    locationController.addListener(() {
      setLocationIcon();
    });
    domainFocusNode.addListener(() {});
    locationFocusNode.addListener(() {});

    if (selectedDomain != DomainEnum.none) {
      domainController.text = Domain.getDomainString(selectedDomain);
      domainSuffixIcon = getSuffixIcon(Icons.check_circle_outline);
    }
    if (selectedLocation != LocationEnum.none) {
      locationController.text = Location.getLocationString(selectedLocation);
      locationSuffixIcon = getSuffixIcon(Icons.check_circle_outline);
    }
  }

  Widget getSuffixIcon(IconData iconData, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        iconData,
        size: 20.sp,
      ),
    );
  }

  void setDomainIcon() {
    if (domainController.text.isNotEmpty &&
        domainController.text != Domain.getDomainString(selectedDomain)) {
      setState(() {
        selectedDomain = DomainEnum.none;
        domainSuffixIcon = getSuffixIcon(Icons.clear, onTap: () {
          domainController.clear();
        });
      });
    } else if (domainController.text.isEmpty) {
      setState(() {
        selectedDomain = DomainEnum.none;
        domainSuffixIcon = getSuffixIcon(Icons.question_mark_outlined);
      });
    }
  }

  void setLocationIcon() {
    if (locationController.text.isNotEmpty &&
        locationController.text !=
            Location.getLocationString(selectedLocation)) {
      setState(() {
        selectedLocation = LocationEnum.none;
        locationSuffixIcon = getSuffixIcon(Icons.clear, onTap: () {
          locationController.clear();
        });
      });
    } else if (locationController.text.isEmpty) {
      setState(() {
        selectedLocation = LocationEnum.none;
        locationSuffixIcon = getSuffixIcon(Icons.question_mark_outlined);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetHeader(
          title: "Apply Filters",
        ),
        const Divider(
          thickness: 2,
          height: 2,
        ),
        Gap(10.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterTitle(title: "Sort By"),
              SegmentedButton<SortEnum>(
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -1, vertical: -1),
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(isDarkMode ? 0.5 : 1);
                      } else {
                        return Colors.transparent;
                      }
                    },
                  ),
                  side: MaterialStatePropertyAll(
                    BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.2,
                    ),
                  ),
                ),
                segments: _sortTypes
                    .map((type) => ButtonSegment<SortEnum>(
                          value: type.sortEnum,
                          label: type.label,
                          icon: Icon(type.icon),
                        ))
                    .toList(),
                selected: <SortEnum>{selectedSort},
                onSelectionChanged: (Set<SortEnum> newSelection) {
                  setState(() {
                    selectedSort = newSelection.first;
                  });
                },
              ),
              const FilterTitle(title: "Domain"),
              CustomTypeAheadField(
                placeHolder: "Filter by Domain",
                controller: domainController,
                focusNode: domainFocusNode,
                suggestionsCallback: domainSuggestionCallback,
                itemBuilder: (BuildContext context, dynamic suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    domainController.text = suggestion;
                    selectedDomain = Domain.getDomainEnum(suggestion);
                    domainSuffixIcon =
                        getSuffixIcon(Icons.check_circle_outline);
                  });
                },
                icon: Icons.domain_outlined,
                suffixIcon: domainSuffixIcon,
                colorEnum: ColorEnum.tertiary,
              ),
              const FilterTitle(title: "Location"),
              CustomTypeAheadField(
                placeHolder: "Filter by Location",
                controller: locationController,
                focusNode: locationFocusNode,
                suggestionsCallback: locationSuggestionCallback,
                itemBuilder: (BuildContext context, dynamic suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    locationController.text = suggestion;
                    selectedLocation = Location.getLocationEnum(suggestion);
                    locationSuffixIcon =
                        getSuffixIcon(Icons.check_circle_outline);
                  });
                },
                icon: Icons.location_on_outlined,
                suffixIcon: locationSuffixIcon,
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 20.sp,
                    ),
                    label: const Text("Cancel"),
                  ),
                  const Gap(20),
                  FilledButton.icon(
                    onPressed: applyFilters,
                    icon: Icon(
                      Icons.check_circle_outline,
                      size: 20.sp,
                    ),
                    label: const Text("Apply"),
                  )
                ],
              ),
              const Gap(24),
            ],
          ),
        ),
      ],
    );
  }

  Future<List<String>> locationSuggestionCallback(String pattern) async {
    return Location.getLocationSuggestion(pattern);
  }

  Future<List<String>> domainSuggestionCallback(String pattern) async {
    return Domain.getDomainSuggestion(pattern);
  }

  void applyFilters() {
    filterController.setFilter(
      selectedSort,
      selectedLocation,
      selectedDomain,
    );
    Navigator.pop(context);
  }
}

class FilterTitle extends StatelessWidget {
  final String title;
  const FilterTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h, bottom: 10.h),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
