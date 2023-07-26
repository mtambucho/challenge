// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:challenge/drawer/drawer.dart';
import 'package:challenge/week_menu/application/week_index_provider.dart';
import 'package:challenge/week_menu/presentation/day_menu_page.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Widget for weak menu called WeekMenuScreen
///show a pageview with the 7 days of the week
///one page for each day
///and in each page you can choose a recipe for that day
///for breakfast, lunch and dinner

class WeekMenuScreen extends ConsumerWidget {
  const WeekMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(weekIndexProvider);
    final state = ref.read(weekIndexProvider.notifier);
    return Scaffold(
      drawer: const AppDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: const Text('Week Menu'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: state.onPageChanged,
          children: List.generate(
            state.totalDays,
            (index) => DayMenuPage(
              dayOfWeek: index,
            ),
          ),
        ),
      ),
    );
  }
}
