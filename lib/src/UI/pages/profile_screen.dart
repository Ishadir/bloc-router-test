import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_prueba/src/router/routes.dart';
import 'package:provider/provider.dart';

import '../../core/provider/session_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<SessionProvider>().setSignedIn(false);
            GoRouter.of(context).goNamed(Routes.signIn);
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
