import 'package:challenge/constants/images.dart';

enum NavBar {
  home,
  challenge,
  excercise,
  fasting,
  settings;

  static List<NavBar> get enabledValues => [
        home,
        challenge,
        fasting,
        settings,
      ];

  @override
  String toString() {
    return switch (this) {
      NavBar.home => 'Recipes',
      NavBar.challenge => 'Challenge',
      NavBar.excercise => 'Excercise',
      NavBar.fasting => 'Ayuno',
      NavBar.settings => 'Settings'
    };
  }

  String get icon {
    return switch (this) {
      NavBar.home => AppImages.icRecipes,
      NavBar.challenge => AppImages.icChallenge,
      NavBar.excercise => AppImages.icTraining,
      NavBar.settings => AppImages.icSettings,
      NavBar.fasting => AppImages.icFasting,
    };
  }
}
