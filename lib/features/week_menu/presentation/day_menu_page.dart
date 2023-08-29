// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/features/home/home_style.dart';
import 'package:challenge/features/preferences/application/preferences_provider.dart';
import 'package:challenge/features/week_menu/application/week_index_provider.dart';
import 'package:challenge/features/week_menu/domain/day_of_week.dart';
import 'package:challenge/features/week_menu/presentation/day_menu_item.dart';
import 'package:challenge/utils/date_helper.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Widget for day menu called DayMenuWidget
///show a pageview with the 3 meals of the day
///one page for each meal
///and in each page you can choose a recipe for that meal
///for breakfast, lunch and dinner

class DayMenuPage extends ConsumerWidget {
  const DayMenuPage({Key? key, required this.dayOfWeek}) : super(key: key);
  final int dayOfWeek;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///format day to show MMM
    final day = DayOfWeek.values[dayOfWeek % 7];
    final week = (dayOfWeek / 7).truncate();
    final startingDate = ref.watch(preferencesProvider).startingDate;
    final date = startingDate.add(Duration(days: dayOfWeek));

    return Column(
      children: [
        ////text with day of week and arrows to change the page
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Visibility(
                  visible: dayOfWeek > 0,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {
                      ref.read(weekIndexProvider.notifier).previousDay();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  )),
              Expanded(
                child: ListTile(
                  title: Text(
                    '${day.toString()} s${week + 1}',
                    textAlign: TextAlign.center,
                    style: HomeStyle.title,
                  ),
                  subtitle: Center(child: Text(date.toDateOnly())),
                ),
              ),
              IconButton(
                  onPressed: () {
                    ref.read(weekIndexProvider.notifier).nextDay();
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),

        DayMenuItem(
          type: MealType.breakfast,
          week: dayOfWeek,
          day: dayOfWeek,
        ),
        DayMenuItem(
          type: MealType.morningSnack,
          week: dayOfWeek,
          day: dayOfWeek,
        ),
        DayMenuItem(
          type: MealType.lunch,
          week: dayOfWeek,
          day: dayOfWeek,
        ),
        DayMenuItem(
          type: MealType.snack,
          week: dayOfWeek,
          day: dayOfWeek,
        ),
        DayMenuItem(
          type: MealType.dinner,
          week: dayOfWeek,
          day: dayOfWeek,
        ),
      ],
    );
  }
}
