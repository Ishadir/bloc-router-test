
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_prueba/src/router/routes.dart';

class ColorsScaffold extends StatelessWidget {
  final Widget child;

  const ColorsScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
   
    final selectedIndex = () {
      final location = GoRouter.of(context).location;
      if (location.startsWith('/red')) {
        return 0;
      }
      if (location.startsWith('/green')) {
        return 1;
      }
      return 2;
    }();

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (i) {
          final route = () {
            if (i == 0) {
              return Routes.red;
            }
            if (i == 1) {
              return Routes.green;
            }

            return Routes.blue;
          }();

          GoRouter.of(context).goNamed(route);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.red,
            ),
            label: 'Red',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.green,
            ),
            label: 'green',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.blue,
            ),
            label: 'blue',
          ),
        ],
      ),
    );
  }
}
