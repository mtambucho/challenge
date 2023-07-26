import 'package:challenge/utils/colors.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../appbar/appbar.dart';

///create a home screen when you have to chose a week number between 1 and 7
///and navigate to the recipes screen passing the week number
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  ///create a home screen when you have to chose a week number between 1 and 7
  ///and navigate to the recipes screen passing the week number
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Challege',
      ),
      body: Center(
          child: Column(
        children: List.generate(7, (index) {
          return Expanded(
            child: WeekItem(
              index: index + 1,
              onTap: () {
                context.pushNamed(Routes.mealType, extra: {
                  'week': index + 1,
                });
              },
              color: AppColors.blue,
            ),
          );
        }),
      )),
    );
  }
}

///Card item to show the index number and onTap callback function
class WeekItem extends StatelessWidget {
  const WeekItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final int index;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.primary2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Semana $index',
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
