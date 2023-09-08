import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/screens/login_page.dart';
import 'package:hitch_handler_v2/theme/constants.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    setSystemOverlay(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
            tooltip: "Settings",
          )
        ],
      ),
      body: const LoginPage(),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        surfaceTintColor: Colors.transparent,
        color: Theme.of(context).colorScheme.surface,
        height: 28,
        child: Column(
          children: [
            Container(
              height: 1.2,
              color:
                  Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              orgName,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
