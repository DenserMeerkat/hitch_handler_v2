import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/auth/auth_bottom_bar.dart';
import 'package:hitch_handler_v2/app/views/auth/auth_page_title.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_body.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_up_body.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/custom_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/misc/app_wrapper.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
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
      child: WillPopScope(
        onWillPop: () {
          if (current == 0) {
            context.go('/');
          } else {
            _tabController.animateTo(0);
          }
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            elevation: 0,
            flexibleSpace: CustomAppBar(
              leading: LeadingWidget(
                onPressed: () {
                  if (current == 0) {
                    context.go('/');
                  } else {
                    _tabController.animateTo(0);
                  }
                },
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
              SignInBody(),
              SignUpBody(),
            ],
          ),
          bottomNavigationBar: AuthBottomBar(tabController: _tabController),
        ),
      ),
    );
  }
}