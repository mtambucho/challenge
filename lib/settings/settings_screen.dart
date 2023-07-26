import 'package:challenge/settings/widgets/first_day_settings.dart';
import 'package:challenge/settings/widgets/startup_page_settings.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FirstDaySettings(),
            const SizedBox(height: 16),
            const StartupPageSettings(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.weekMenu);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
