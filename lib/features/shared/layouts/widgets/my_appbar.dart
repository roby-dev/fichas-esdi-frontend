import 'package:fichas_esdi/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 48);

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPading = MediaQuery.of(context).padding;

    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: safeAreaPading.top, left: 24, right: 24),
        height: preferredSize.height + safeAreaPading.top,
        color: Theme.of(context).colorScheme.inversePrimary,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home, size: 20, color: Colors.white),
            Row(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return IconButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).logout();
                      },
                      icon: const Icon(Icons.logout, color: Colors.white),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
