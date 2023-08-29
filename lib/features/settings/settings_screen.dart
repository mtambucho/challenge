import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/constants/strings.dart';
import 'package:challenge/features/settings/widgets/first_day_settings.dart';
import 'package:challenge/features/settings/widgets/startup_page_settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.settings,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FirstDaySettings(),
            SizedBox(height: 16),
            StartupPageSettings(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
