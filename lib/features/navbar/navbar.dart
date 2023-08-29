import 'package:challenge/constants/images.dart';
import 'package:challenge/constants/strings.dart';

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
      NavBar.home => AppStrings.home,
      NavBar.challenge => AppStrings.challenge,
      NavBar.excercise => AppStrings.excercise,
      NavBar.fasting => AppStrings.fasting,
      NavBar.settings => AppStrings.settings
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
