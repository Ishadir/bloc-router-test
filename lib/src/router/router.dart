import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_prueba/main.dart';
import 'package:go_router_prueba/src/core/provider/session_provider.dart';
import 'package:go_router_prueba/src/router/routes.dart';
import 'package:provider/provider.dart';

import '../UI/pages/error_view.dart';
import '../UI/pages/home/home_screen.dart';
import '../UI/pages/home/product_screen.dart';
import '../UI/pages/home/widgets/scaffold.dart';
import '../UI/pages/profile_screen.dart';
import '../UI/pages/sign_in_screen.dart';
import '../UI/pages/welcome_screen.dart';
import '../core/bloc/bloc/counter_bloc.dart';

mixin RouterMixin on State<MyApp> {
  final routeNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  GoRouter? _router;

  GoRouter get router {
    _router ??= GoRouter(
      navigatorKey: routeNavigatorKey,
      initialLocation: '/',
      errorBuilder: (_, state) => ErrorView(goRouterState: state),
      routes: [
        GoRoute(
          name: Routes.welcome,
          path: '/',
          builder: (_, __) => WelcomeScreen(),
        ),
        GoRoute(
          name: Routes.signIn,
          path: '/sign-in',
          builder: (_, state) {
            final callbackURL = state.queryParameters['callbackURL'];

            return SignInScreen(
              callbackURL ?? '/home',
            );
          },
          redirect: (context, state) {
            final isSignedIn = context.read<SessionProvider>().isSignedIn;
            if (isSignedIn) {
              return '/home';
            }
            return null;
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return HomeScaffold(child: child);
          },
          routes: [
            GoRoute(
              name: Routes.home,
              path: '/home',
              builder: (_, __) => HomeScreen(),
            ),
            GoRoute(
              name: Routes.product,
              path: '/product/:id',
              builder: (_, state) {
                final id = state.pathParameters['id']!;
                final bloc = state.extra as CounterBloc? ?? CounterBloc();
                return BlocProvider<CounterBloc>.value(
                  value: bloc,
                  child: ProductScreen(id: int.parse(id)),
                );
              },
              redirect: (context, state) => authGuard(
                  context: context,
                  state: state,
                  callbackURL: '/product/${state.pathParameters['id']}'),
            ),
            GoRoute(
              name: Routes.profile,
              path: '/profile',
              builder: (_, __) => ProfileScreen(),
              redirect: (context, state) => authGuard(
                  context: context, state: state, callbackURL: '/profile'),
            ),
          ],
        ),
      ],
    );
    return _router!;
  }
}

FutureOr<String?> authGuard({
  required BuildContext context,
  required GoRouterState state,
  required String callbackURL,
}) async {
  final isSignedIn = context.read<SessionProvider>().isSignedIn;
  if (isSignedIn) {
    return null;
  }
  return '/sign-in?callbackURL=$callbackURL';
}
