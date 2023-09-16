import 'package:flutter/material.dart';
import 'package:hitch_handler_v2/app/types/auth_types.dart';

class AuthBottomBar extends StatelessWidget {
  AuthBottomBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<AuthTabType> tabs = authTabs;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Theme.of(context).appBarTheme.backgroundColor,
      height: 50,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorWeight: 4,
            dividerColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            indicator: UnderlineTabIndicator(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 3.4,
              ),
              insets: const EdgeInsets.fromLTRB(50.0, 0.0, 52.0, 42.0),
            ),
            tabs: [
              AuthTab(
                title: tabs[0].title,
              ),
              AuthTab(
                title: tabs[1].title,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AuthTab extends StatelessWidget {
  final String title;
  const AuthTab({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
