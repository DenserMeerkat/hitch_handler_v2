import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/otp_body.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/custom_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/page_title.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class OtpPage extends StatefulWidget {
  final String contact;
  const OtpPage({
    super.key,
    required this.contact,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int current = _tabController.index;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _handleTabChange();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _handleTabChange() {
    if (!mounted) return;
    setState(() {
      current = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: Scaffold(
        backgroundColor: isDark(context) ? kGrey30 : kLBlack10,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: isDark(context) ? kBlack20 : kLBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: CustomAppBar(
            leading: LeadingWidget(
              onPressed: () => context.go('/'),
            ),
            title: const PageTitle(
              title: "Verify",
              icon: Icons.task_alt_outlined,
            ),
          ),
          bottom: bottomLine(context),
        ),
        body: OtpBody(
          contact: widget.contact,
        ),
      ),
    );
  }
}