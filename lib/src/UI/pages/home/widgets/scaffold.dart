import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/routes.dart';

class HomeScaffold extends StatefulWidget {
  final Widget child;

  const HomeScaffold({super.key, required this.child});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  final counter = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      counter.value++;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      counter.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ValueListenableBuilder<int>(
            builder: (BuildContext context, value, Widget? child) {
              return AppBar(
                leading: value > 0 && GoRouter.of(context).canPop()
                    ? BackButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      )
                    : null,
                actions: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(Routes.profile);
                    },
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(width: 20),
                ],
              );
            },
            valueListenable: counter,
          ),
          preferredSize: Size.fromHeight(kToolbarHeight)),
      body: widget.child,
    );
  }
}
