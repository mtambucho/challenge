import 'package:challenge/constants/strings.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  @override
  String toString() {
    return switch (this) {
      DayOfWeek.monday => AppStrings.monday,
      DayOfWeek.tuesday => AppStrings.tuesday,
      DayOfWeek.wednesday => AppStrings.wednesday,
      DayOfWeek.thursday => AppStrings.thursday,
      DayOfWeek.friday => AppStrings.friday,
      DayOfWeek.saturday => AppStrings.saturday,
      DayOfWeek.sunday => AppStrings.sunday,
    };
  }
}
