import 'package:fichas_esdi/core/constants/app_constants.dart';
import 'package:fichas_esdi/core/providers/core_providers.dart';
import 'package:fichas_esdi/features/auth/presentation/pages/login_page.dart';
import 'package:fichas_esdi/features/auth/presentation/providers/auth_providers.dart';
import 'package:fichas_esdi/features/children/presentation/routes/children_router.dart';
import 'package:fichas_esdi/features/home/presentation/routes/home_router.dart';
import 'package:fichas_esdi/features/management_committees/presentation/routes/committees_router.dart';
import 'package:fichas_esdi/features/shared/layouts/layout_1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> mainShellNavigatorKey =
    GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final sharedPreferencesState = ref.watch(sharedPreferencesProvider);

  return GoRouter(
    initialLocation: '/login',
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isLoginRoute = state.fullPath == '/login';

      if (!isAuthenticated && !isLoginRoute) {
        return '/login';
      }

      if (isAuthenticated && isLoginRoute) {
        if (sharedPreferencesState.getString(AppConstants.committeeKey) ==
                null ||
            sharedPreferencesState
                .getString(AppConstants.committeeKey)!
                .isEmpty) {
          return '/committees';
        }
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      ShellRoute(
        builder: (context, state, child) {
          return Layout1(child: child);
        },
        navigatorKey: mainShellNavigatorKey,
        routes: <RouteBase>[homeRouter, childrenRouter, committeesRouter],
      ),
    ],
  );
});
