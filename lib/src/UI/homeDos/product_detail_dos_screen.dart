import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProductsDetailDosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Products detail dos screen'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/homedos');
              },
              child: Text('Push to product_dos'),
            )
          ],
        ),
      ),
    );
  }
}
