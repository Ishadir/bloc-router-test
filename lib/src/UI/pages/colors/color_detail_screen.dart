import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorDetailScreen extends StatelessWidget {
    final Color color;

  const ColorDetailScreen({super.key, required this.color});

  static GoRoute getRoute(MaterialColor materialColor) {
    return GoRoute(
      path: ':shade',
      builder: (context, state) {
        final shade = int.parse(state.pathParameters['shade']!);
        return ColorDetailScreen(
          color: materialColor[shade]!,
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: color,
          ),
          Expanded(
            child: Container(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
