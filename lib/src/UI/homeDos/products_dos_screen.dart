import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProductsDosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Products PAGE 2!!!! (here i do pushreplacement)'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).replace('/main-screen');
              },
              child: Text('Push to main'),
            )
          ],
        ),
      ),
    );
  }
}
