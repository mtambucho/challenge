import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///create drawer with options
///- home (go to week menu)
///- cart (go to cart)
///- settings (go to settings)

class AppDrawer extends ConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Recipes'),
            onTap: () => _goTo(context, Routes.mealType),
          ),
          ListTile(
            title: const Text('Challenge'),
            onTap: () => _goTo(context, Routes.weekMenu),
          ),
          ListTile(
            title: const Text('Cart'),
            onTap: () =>
                _goTo(context, Routes.cart, extra: {"showDrawer": true}),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () => _goTo(context, Routes.settings),
          ),
        ],
      ),
    );
  }

  void _goTo(BuildContext context, String route, {Object? extra}) {
    final router = GoRouter.of(context);
    final currentRoute = router.location;
    if (currentRoute != route) {
      context.goNamed(route, extra: extra);
    } else {
      Navigator.pop(context);
    }
  }
}
