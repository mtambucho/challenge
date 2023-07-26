import 'package:challenge/utils/router.dart';
import 'package:challenge/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  //todo when  firebase added
  Firebase.initializeApp();

  ///set device orientations
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      showSemanticsDebugger: false,
      routerConfig: goRouter,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appThemeData,
    );
  }
}

class AppStrings {
  static const appName = 'Challenge Flutter';
}
