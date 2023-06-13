// import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router_prueba/src/UI/pages/error_view.dart';
// import 'package:go_router_prueba/src/UI/pages/home/home_screen.dart';
// import 'package:go_router_prueba/src/UI/pages/home/product_screen.dart';
// import 'package:go_router_prueba/src/UI/pages/home/widgets/scaffold.dart';
// import 'package:go_router_prueba/src/UI/pages/profile_screen.dart';
// import 'package:go_router_prueba/src/UI/pages/sign_in_screen.dart';
// import 'package:go_router_prueba/src/UI/pages/welcome_screen.dart';
// import 'package:go_router_prueba/src/router/routes.dart';
import 'package:go_router_prueba/src/core/provider/session_provider.dart';
import 'package:go_router_prueba/src/router/router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_strategy/url_strategy.dart';

final routeNavigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  final _prefs = await SharedPreferences.getInstance();
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  // HydratedBloc.storage = await HydratedStorage.build(
  //     storageDirectory: kIsWeb
  //         ? HydratedStorage.webStorageDirectory
  //         : await getTemporaryDirectory());

  runApp(
    Provider<SessionProvider>(
      create: (_) => SessionProvider(_prefs),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      // routerConfig: GoRouter(
      //   navigatorKey: routeNavigatorKey,
      //   initialLocation: '/',
      //   errorBuilder: (_, state) => ErrorView(goRouterState: state),
      //   routes: [
      //     GoRoute(
      //       name: Routes.welcome,
      //       path: '/',
      //       builder: (_, __) => WelcomeScreen(),
      //     ),
      //     GoRoute(
      //       name: Routes.signIn,
      //       path: '/sign-in',
      //       builder: (_, state) {
      //         final callbackURL = state.queryParameters['callbackURL'];

      //         return SignInScreen(
      //           callbackURL ?? '/home',
      //         );
      //       },
      //       redirect: (context, state) {
      //         final isSignedIn =Provider.of<SessionProvider>(context).isSignedIn;

      //         if (isSignedIn) {
      //           return '/home';
      //         }
      //         return null;
      //       },
      //     ),
      //     ShellRoute(
      //       builder: (context, state, child) {
      //         return HomeScaffold(child: child);
      //       },
      //       routes: [
      //         GoRoute(
      //           name: Routes.home,
      //           path: '/home',
      //           builder: (_, __) => HomeScreen(),
      //         ),
      //         GoRoute(
      //           name: Routes.product,
      //           path: '/product/:id',
      //           builder: (_, state) {
      //             final id = state.pathParameters['id']!;
      //             return ProductScreen(id: int.parse(id));
      //           },
      //           redirect: (context, state) => authGuard(
      //               context: context,
      //               state: state,
      //               callbackURL: '/product/${state.pathParameters['id']}'),
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       name: Routes.profile,
      //       path: '/profile',
      //       builder: (_, __) => ProfileScreen(),
      //       redirect: (context, state) => authGuard(
      //           context: context, state: state, callbackURL: '/profile'),
      //     ),
      //   ],
      // )
    );
  }
}

// FutureOr<String?> authGuard({
//   required BuildContext context,
//   required GoRouterState state,
//   required String callbackURL,
// }) async {
//   final isSignedIn = context.read<SessionProvider>().isSignedIn;
//   if (isSignedIn) {
//     return null;
//   }
//   return '/sign-in?callbackURL=$callbackURL';
// }
