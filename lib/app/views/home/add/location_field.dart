import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/data/enums/location.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class LocationField extends StatefulWidget {
  const LocationField({super.key});

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  final TextEditingController locationController = TextEditingController();
  final FocusNode locationFocusNode = FocusNode();
  late PostProvider postProvider;
  late LocationEnum selectedLocation;
  Widget? suffixIcon;

  @override
  void initState() {
    super.initState();
    postProvider = context.read<PostProvider>();
    selectedLocation = postProvider.location;
    if (selectedLocation != LocationEnum.none) {
      locationController.text = Location.getLocationString(selectedLocation);
      locationController.selection = TextSelection.fromPosition(
        TextPosition(offset: locationController.text.length),
      );
    }
    locationController.addListener(updateLocation);
  }

  @override
  void dispose() {
    locationController.dispose();
    locationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateIcon();
    return PlainTypeAheadField(
      placeHolder: "Location",
      controller: locationController,
      focusNode: locationFocusNode,
      direction: AxisDirection.down,
      suggestionsCallback: locationSuggestionCallback,
      itemBuilder: (BuildContext context, dynamic suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSuggestionSelected: (suggestion) {
        locationController.text = suggestion;
      },
      suffixIcon: suffixIcon,
      icon: Icons.place_outlined,
      noItemFoundIcon: Icons.wrong_location_outlined,
      maxWidth: 360.w - 40,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  void updateIcon() {
    if (selectedLocation != LocationEnum.none) {
      suffixIcon = Icon(
        Icons.check_circle_outline,
        color: Theme.of(context).colorScheme.primary,
      );
    } else if (locationController.text.isEmpty &&
        selectedLocation == LocationEnum.none) {
      suffixIcon = null;
    } else if (locationController.text.isNotEmpty &&
        selectedLocation == LocationEnum.none) {
      suffixIcon = Icon(
        Icons.error_outline_rounded,
        color: Theme.of(context).colorScheme.error,
      );
    } else {
      suffixIcon = null;
    }
  }

  void updateLocation() {
    if (locationController.text.isEmpty) {
      if (!mounted) return;
      setState(() {
        selectedLocation = LocationEnum.none;
      });
      postProvider.updateLocation(selectedLocation);
    } else if (locationController.text.isNotEmpty &&
        Location.getLocationEnum(locationController.text) !=
            LocationEnum.none) {
      if (!mounted) return;
      setState(() {
        selectedLocation = Location.getLocationEnum(locationController.text);
      });
      postProvider.updateLocation(selectedLocation);
    } else if (locationController.text.isNotEmpty &&
        locationController.text !=
            Location.getLocationString(selectedLocation)) {
      if (!mounted) return;
      setState(() {
        selectedLocation = LocationEnum.none;
      });
      postProvider.updateLocation(selectedLocation);
    }
  }

  Future<List<String>> locationSuggestionCallback(String pattern) async {
    return Location.getLocationSuggestion(pattern);
  }
}
