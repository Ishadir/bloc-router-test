
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorsScreen extends StatelessWidget {
  final MaterialColor color;
  final String colorName;

  const ColorsScreen({
    Key? key,
    required this.color,
    required this.colorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        AppBar(
          backgroundColor: color,
          title: Text(colorName),
          centerTitle: true,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 9,
            shrinkWrap: true,
            itemBuilder: (BuildContext _, int index) {
              final shade = 100 * index + 100;
              final variant = color[shade]!;
              return InkWell(
                onTap: () {
                  final router = GoRouter.of(context);
                  final location =
                      router.namedLocation(colorName.toLowerCase());
                  router.push('$location/$shade');
                },
                child: Container(
                  height: 100.0,
                  color: variant,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
