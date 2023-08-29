import 'package:challenge/features/preferences/domain/preferences.dart';
import 'package:challenge/services/local_storage_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a provider with riverpod to save Preferences
///with a function to save the starting date of the week

final preferencesProvider =
    StateNotifierProvider<PreferencesProvider, Preferences>((ref) {
  final localStorage = ref.read(localStorageManagerProvider);
  final preferences = localStorage.getPreferences();
  return PreferencesProvider(preferences, localStorage);
});

class PreferencesProvider extends StateNotifier<Preferences> {
  PreferencesProvider(Preferences state, this.localStorageManager)
      : super(state);
  final LocalStorageManager localStorageManager;
  void saveStartingDate(DateTime date) {
    state = Preferences(date);
    localStorageManager.savePreferences(state);
  }
}
