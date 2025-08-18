import 'package:fichas_esdi/features/children/presentation/pages/child_page.dart';
import 'package:fichas_esdi/features/children/presentation/pages/children_page.dart';
import 'package:go_router/go_router.dart';

final childrenRouter = GoRoute(
  path: '/children',
  builder: (context, state) => const ChildrenPage(),
  routes: [
    GoRoute(path: 'new', builder: (context, state) => const ChildPage()),
    GoRoute(
      path: ':id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ChildPage(id: id);
      },
    ),
  ],
);
