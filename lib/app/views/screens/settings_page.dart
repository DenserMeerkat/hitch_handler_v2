import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hitch_handler_v2/app/views/widgets/common/bottom_line.dart';
import 'package:hitch_handler_v2/theme/theme_utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    setSystemOverlay(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    context.pop("settings");
                  },
                  tooltip: "Back",
                ),
              ),
            );
          },
        ),
        bottom: bottomLine(context),
        toolbarHeight: kToolbarHeight,
      ),
      body: Container(),
    );
  }
}
