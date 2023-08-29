import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
class Preferences with _$Preferences {
  factory Preferences(
    @JsonKey(name: 'startingDate') DateTime startingDate,
  ) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}
