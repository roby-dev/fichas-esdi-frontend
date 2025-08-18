import 'package:fichas_esdi/core/session/user_session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 48);

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPading = MediaQuery.of(context).padding;

    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      flexibleSpace: Container(
        height: preferredSize.height + safeAreaPading.top,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50),
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  ref.watch(userSessionProvider).committeeName ??
                      'No Seleccionado',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
            Spacer(),
            Row(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return IconButton(
                      onPressed: () {
                        context.push('/committees');
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
