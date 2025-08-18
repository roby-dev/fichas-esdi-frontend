import 'package:fichas_esdi/features/shared/drawers/widgets/my_drawer.dart';
import 'package:fichas_esdi/features/shared/layouts/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Layout1 extends ConsumerStatefulWidget {
  final Widget child;

  const Layout1({super.key, required this.child});

  @override
  Layout1State createState() => Layout1State();
}

class Layout1State extends ConsumerState<Layout1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [SliverFillRemaining(child: widget.child)],
        ),
      ),
      appBar: const MyAppbar(),
      drawer: const MyDrawer(),
    );
  }
}
