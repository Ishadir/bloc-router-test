import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_prueba/src/core/provider/session_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  final String callbackURL;

  const SignInScreen(
    this.callbackURL, {
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              context.read<SessionProvider>().setSignedIn(true);
              GoRouter.of(context).go(callbackURL);
            },
            child: Text('INICIAR SESION')),
      ),
    );
  }
}
