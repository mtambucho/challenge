import 'package:challenge/preferences/application/preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///provider to manage the day of the week or the pageView
final weekIndexProvider =
    StateNotifierProvider<WeekIndexProvider, PageController>((ref) {
  ///get starting date
  final startingDate = ref.watch(preferencesProvider).startingDate;
  final days = DateTime.now().difference(startingDate).inDays;

  return WeekIndexProvider(days);
});

class WeekIndexProvider extends StateNotifier<PageController> {
  WeekIndexProvider(int days) : super(PageController(initialPage: days));

  ///seven weeks
  int get totalDays => 7 * 7;

  void nextDay() {
    if (state.page!.toInt() < totalDays - 1) {
      state.nextPage(
          duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
    }
  }

  void previousDay() {
    if (state.page!.toInt() > 0) {
      state.previousPage(
          duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
    }
  }

  void onPageChanged(int value) {
    state.animateToPage(value,
        duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
  }
}
