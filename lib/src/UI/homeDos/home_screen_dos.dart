import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('HOME PAGE!!!!'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/products-dos');
              },
              child: Text('Push to product_dos'),
            )
          ],
        ),
      ),
    );
  }
}
