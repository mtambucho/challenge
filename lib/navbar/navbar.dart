import 'package:flutter/material.dart';

enum NavBar {
  home,
  challenge,
  excercise,
  settings;

  static List<NavBar> get enabledValues => [
        home,
        challenge,
        settings,
      ];

  @override
  String toString() {
    return switch (this) {
      NavBar.home => 'Recipes',
      NavBar.challenge => 'Challenge',
      NavBar.excercise => 'Excercise',
      NavBar.settings => 'Settings'
    };
  }

  IconData get icon {
    return switch (this) {
      NavBar.home => Icons.menu_book_rounded,
      NavBar.challenge => Icons.no_food_outlined,
      NavBar.excercise => Icons.sports_gymnastics,
      NavBar.settings => Icons.settings
    };
  }
}
