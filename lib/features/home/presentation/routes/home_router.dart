import 'package:fichas_esdi/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final homeRouter = GoRoute(
  path: '/home',
  builder: (context, state) {
    return const HomePage();
  },
);
