import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_prueba/src/router/routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Welcome Screen'),
            Text('Bienvenidos a esta página'),
            ElevatedButton(onPressed: () {
              GoRouter.of(context).pushNamed(Routes.signIn);
            }, child: Text('Iniciar sesion'))
          ],
        ),
      ),
    );
  }
}
