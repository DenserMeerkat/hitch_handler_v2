import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/inputs.dart';
import 'package:hitch_handler_v2/data/enums/domain.dart';
import 'package:hitch_handler_v2/providers/providers.dart';
import 'package:provider/provider.dart';

class DomainField extends StatefulWidget {
  const DomainField({super.key});

  @override
  State<DomainField> createState() => _DomainFieldState();
}

class _DomainFieldState extends State<DomainField> {
  final TextEditingController domainController = TextEditingController();
  final FocusNode domainFocusNode = FocusNode();
  late AddPostProvider addPostProvider;
  late DomainEnum selectedDomain;
  Widget? suffixIcon;

  @override
  void initState() {
    super.initState();
    addPostProvider = context.read<AddPostProvider>();
    selectedDomain = addPostProvider.domain;
    if (selectedDomain != DomainEnum.none) {
      domainController.text = Domain.getDomainString(selectedDomain);
      domainController.selection = TextSelection.fromPosition(
        TextPosition(offset: domainController.text.length),
      );
    }
    domainController.addListener(updateDomain);
  }

  @override
  void dispose() {
    domainController.dispose();
    domainFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateIcon();
    return PlainTypeAheadField(
      placeHolder: "Domain",
      controller: domainController,
      focusNode: domainFocusNode,
      direction: AxisDirection.down,
      suggestionsCallback: domainSuggestionCallback,
      itemBuilder: (BuildContext context, dynamic suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSuggestionSelected: (suggestion) {
        domainController.text = suggestion;
      },
      suffixIcon: suffixIcon,
      icon: Icons.domain_outlined,
      noItemFoundIcon: Icons.domain_disabled_outlined,
      minCharsForSuggestions: 0,
      maxWidth: 360.w - 40,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      enabled: !context.watch<AddPostProvider>().isLoading,
    );
  }

  void updateIcon() {
    if (selectedDomain != DomainEnum.none) {
      suffixIcon = Icon(
        Icons.check_circle_outline,
        color: Theme.of(context).colorScheme.primary,
      );
    } else if (domainController.text.isEmpty &&
        selectedDomain == DomainEnum.none) {
      suffixIcon = null;
    } else if (domainController.text.isNotEmpty &&
        selectedDomain == DomainEnum.none) {
      suffixIcon = Icon(
        Icons.error_outline_rounded,
        color: Theme.of(context).colorScheme.error,
      );
    } else {
      suffixIcon = null;
    }
  }

  void updateDomain() {
    if (domainController.text.isEmpty) {
      if (!mounted) return;
      setState(() {
        selectedDomain = DomainEnum.none;
      });
      addPostProvider.updateDomain(selectedDomain);
    } else if (domainController.text.isNotEmpty &&
        Domain.getDomainEnum(domainController.text) != DomainEnum.none) {
      if (!mounted) return;
      setState(() {
        selectedDomain = Domain.getDomainEnum(domainController.text);
      });
      addPostProvider.updateDomain(selectedDomain);
    } else if (domainController.text.isNotEmpty &&
        domainController.text != Domain.getDomainString(selectedDomain)) {
      if (!mounted) return;
      setState(() {
        selectedDomain = DomainEnum.none;
      });
      addPostProvider.updateDomain(selectedDomain);
    }
  }

  Future<List<String>> domainSuggestionCallback(String pattern) async {
    return Domain.getDomainSuggestion(pattern);
  }
}
