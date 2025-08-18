import 'package:fichas_esdi/core/session/user_session_provider.dart';
import 'package:fichas_esdi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pop(context); // cerrar drawer
    context.go(route);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userSessionProvider);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: SizedBox.expand(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bienvenido, ${userState.email}',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),

          // Opciones de navegación
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('Inicio'),
                  onTap: () => _navigate(context, '/home'),
                ),

                ExpansionTile(
                  collapsedIconColor: Theme.of(context).colorScheme.primary,
                  leading: Icon(
                    Icons.child_care_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('Niños'),
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: const Text('Ver niños'),
                      onTap: () => _navigate(context, '/children'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: const Text('Crear niño'),
                      onTap: () => _navigate(context, '/children/new'),
                    ),
                  ],
                ),

                ExpansionTile(
                  collapsedIconColor: Theme.of(context).colorScheme.primary,
                  leading: Icon(
                    Icons.warning,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('Señales de alerta'),
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.list,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: const Text('Ver señales'),
                      onTap: () => _navigate(context, '/signals'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.update,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: const Text('Actualizar señales'),
                      onTap: () => _navigate(context, '/signals/update'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Botón de cerrar sesión abajo
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
    );
  }
}
