import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/constants/strings.dart';
import 'package:challenge/features/week_menu/application/week_index_provider.dart';
import 'package:challenge/features/week_menu/presentation/day_menu_page.dart';
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
      drawerEnableOpenDragGesture: false,
      appBar: const CustomAppBar(
        title: AppStrings.weekMenu,
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
