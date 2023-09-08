import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hitch_handler_v2/app/views/widgets/common/bottom_line.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/multi_field.dart';
import 'package:hitch_handler_v2/app/views/widgets/inputs/password_field.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setSystemOverlay(context);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: const ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    child: Material(
                      type: MaterialType.transparency,
                      child: TabBar(
                        indicatorWeight: 4,
                        tabs: [
                          Tab(
                            height: 52,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          Tab(
                            height: 52,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottom: bottomLine(context),
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 330.w,
                      child: const Column(
                        children: [
                          MultiField(),
                          SizedBox(
                            height: 20,
                          ),
                          PasswordField(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 330.w,
                      child: const Column(
                        children: [
                          MultiField(),
                          SizedBox(
                            height: 20,
                          ),
                          PasswordField(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
