import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/types/auth_types.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_in_body.dart';
import 'package:hitch_handler_v2/app/views/auth/sign_up_body.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/home_app_bar.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/leading_widget.dart';
import 'package:hitch_handler_v2/app/views/widgets/header/page_title.dart';
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
  final List<AuthTabType> myTabs = <AuthTabType>[
    const AuthTabType(
      title: "Sign In",
      icon: Icons.person,
    ),
    const AuthTabType(
      title: "Sign Up",
      icon: Icons.person_add,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _handleTabChange();
    });
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
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: isDark(context) ? kGrey30 : kLBlack10,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: HomeAppBar(
                leading: LeadingWidget(
                  onPressed: () => context.go('/'),
                ),
                title: PageTitle(
                  title: myTabs[current].title,
                  icon: myTabs[current].icon,
                ),
              ),
            ),
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
      bottomNavigationBar: BottomAppBar(
        height: 50,
        padding: EdgeInsets.zero,
        child: Container(
          color: isDark(context) ? kBlack20 : kLBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: isDark(context) ? kBlack15 : kLBlack15,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                indicatorWeight: 4,
                dividerColor: Colors.transparent,
                indicator: UnderlineTabIndicator(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 3.4),
                  insets: const EdgeInsets.fromLTRB(50.0, 0.0, 52.0, 43.0),
                ),
                tabs: const [
                  Tab(
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
