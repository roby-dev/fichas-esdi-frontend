import 'package:fichas_esdi/features/management_committees/presentation/pages/committees_page.dart';
import 'package:go_router/go_router.dart';

final committeesRouter = GoRoute(
  path: '/committees',
  builder: (context, state) => const CommitteesPage(),
  routes: [],
);
