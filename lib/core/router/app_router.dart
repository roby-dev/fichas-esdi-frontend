import 'package:fichas_esdi/features/auth/presentation/pages/login_page.dart';
import 'package:fichas_esdi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                icon: const Icon(Icons.logout),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Bienvenido a Fichas ESDI!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isLoginRoute = state.fullPath == '/login';

      if (!isAuthenticated && !isLoginRoute) {
        return '/login';
      }

      if (isAuthenticated && isLoginRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
});
