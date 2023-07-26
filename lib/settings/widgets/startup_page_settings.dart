import 'package:challenge/services/local_storage_manager.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartupPageSettings extends StatelessWidget {
  const StartupPageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Startup page:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Consumer(builder: (context, ref, child) {
          final startup = ref.watch(startupPageProvider);

          ///return dropdown with 2 options (recipes and week menu)
          return DropdownButton<String>(
            value: startup,
            onChanged: (value) => ref
                .read(startupPageProvider.notifier)
                .changeStartupPage(value!),
            items: const [
              DropdownMenuItem(
                value: Routes.mealType,
                child: Text('Recipes'),
              ),
              DropdownMenuItem(
                value: Routes.weekMenu,
                child: Text('Challenge'),
              ),
            ],
          );
        }),
      ],
    );
  }
}

///create a provider to manage the favorites recipes
final startupPageProvider =
    StateNotifierProvider<StartupPageNotifier, String>((ref) {
  final localManager = ref.read(localStorageManagerProvider);
  final startupPage = localManager.getStartupPage();

  return StartupPageNotifier(startupPage, localManager);
});

class StartupPageNotifier extends StateNotifier<String> {
  StartupPageNotifier(String startupPage, this.localStorageManager)
      : super(startupPage);
  final LocalStorageManager localStorageManager;

  void changeStartupPage(String startupPage) {
    state = startupPage;
    localStorageManager.saveStartupPage(startupPage);
  }
}
