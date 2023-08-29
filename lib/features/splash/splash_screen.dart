import 'package:challenge/constants/colors.dart';
import 'package:challenge/constants/images.dart';
import 'package:challenge/features/cart/application/cart_provider.dart';
import 'package:challenge/features/settings/widgets/startup_page_settings.dart';
import 'package:challenge/services/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///create a stateful widget for a  splash screen with riverpod and go_router show the screen for some time and then navigate to home screen
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

///create a state for a  splash screen with riverpod and go_router show the screen for some time and then navigate to home screen
class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {
    await ref.read(localStorageManagerProvider).init();
    ref.read(cartProvider.notifier).init();
    //navigate to home screen after 1s seconds with go_router
    Future.delayed(const Duration(seconds: 1), () {
      // context.go(RoutesNames.weekMenu);
      final page = ref.read(startupPageProvider);
      context.go(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    ///show icon centered
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          AppImages.appIcon,
          width: 400,
          height: 400,
          // color: AppColors.primary,
        ),
      ),
    );
  }
}
