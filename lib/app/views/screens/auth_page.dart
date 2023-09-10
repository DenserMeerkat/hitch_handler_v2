import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/auth_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_body.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_up_body.dart';
import 'package:hitch_handler_v2/app/views/auth/auth_page_title.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/custom_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int current = _tabController.index;

  bool isLoading = false;

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
    setState(() {
      current = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: AuthPageTitle(
            tabController: _tabController,
          ),
        ),
        bottom: bottomLine(context),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: SignInBody(),
          ),
          Center(
            child: SignUpBody(),
          )
        ],
      ),
      bottomNavigationBar: AuthBottomBar(tabController: _tabController),
    );
  }
}
