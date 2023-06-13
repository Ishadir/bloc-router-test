// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:go_router_prueba/main.dart';
// import 'package:go_router_prueba/src/UI/pages/error_view.dart';
// import 'package:go_router_prueba/src/core/provider/session_provider.dart';
// import 'package:go_router_prueba/src/router/routes.dart';
// import 'package:provider/provider.dart';

// import '../UI/pages/home/home_screen.dart';
// import '../UI/pages/home/product_screen.dart';
// import '../UI/pages/home/widgets/scaffold.dart';
// import '../UI/pages/profile_screen.dart';
// import '../UI/pages/sign_in_screen.dart';


// mixin RouterMixin on State<MyApp> {
//   final routeNavigatorKey = GlobalKey<NavigatorState>();
//   GoRouter? _router;

//   GoRouter get router {
//     _router ??= GoRouter(
//       initialLocation: '/homedos',
//       navigatorKey: routeNavigatorKey,
//       errorBuilder: (_, state) => ErrorView(goRouterState: state),
//       routes: [
//         // GoRoute(
//         //   name: Routes.homeDos,
//         //   path: '/homedos',
//         //   builder: (_, __) => HomeDosScreen(),
//         // ),
//         // GoRoute(
//         //   name: Routes.mainScreen,
//         //   path: '/main-screen',
//         //   builder: (_, __) => MainScreen(),
//         // ),
//         // ShellRoute(
//         //   builder: (context, state, child) {
//         //     return ColorsScaffold(child: child);
//         //   },
//         //   routes: [
//         //     GoRoute(
//         //       name: Routes.red,
//         //       path: '/red',
//         //       builder: (_, __) => ColorsScreen(
//         //         color: Colors.red,
//         //         colorName: 'RED',
//         //       ),
//         //       routes: [ColorDetailScreen.getRoute(Colors.red)],
//         //     ),
//         //     GoRoute(
//         //         name: Routes.green,
//         //         path: '/green',
//         //         builder: (_, __) => ColorsScreen(
//         //               color: Colors.green,
//         //               colorName: 'GREEN',
//         //             ),
//         //         routes: [ColorDetailScreen.getRoute(Colors.green)]),
//         //     GoRoute(
//         //         name: Routes.blue,
//         //         path: '/blue',
//         //         builder: (_, __) => ColorsScreen(
//         //               color: Colors.blue,
//         //               colorName: 'BLUE',
//         //             ),
//         //         routes: [ColorDetailScreen.getRoute(Colors.blue)]),
//         //   ],
//         // ),
//         ShellRoute(
//           builder: (context, state, child) {
//             return HomeScaffold(child: child);
//           },
//           routes: [
//             GoRoute(
//               name: Routes.home,
//               path: '/',
//               builder: (_, __) => HomeScreen(),
//             ),
//             GoRoute(
//               name: Routes.product,
//               path: '/product/:id',
//               builder: (_, state) {
//                 final id = state.pathParameters['id']!;
//                 return ProductScreen(id: int.parse(id));
//               },
//               redirect: (context, state) => authGuard(
//                   context: context,
//                   state: state,
//                   callbackURL: '/product/${state.pathParameters['id']}'),
//             ),
//           ],
//         ),
//         GoRoute(
//           name: Routes.profile,
//           path: '/profile',
//           builder: (_, __) => ProfileScreen(),
//           parentNavigatorKey: routeNavigatorKey,
//           redirect: (context, state) => authGuard(
//               context: context, state: state, callbackURL: '/profile'),
//         ),
//         GoRoute(
//           name: Routes.signIn,
//           path: '/sign-in',
//           parentNavigatorKey: routeNavigatorKey,
//           builder: (_, state) {
//             final callbackURL = state.pathParameters['callbackURL'];

//             return SignInScreen(
//               callbackURL: callbackURL ?? '/',
//             );
//           },
//           redirect: (context, state) {
//             final isSignedIn = context.read<SessionProvider>().isSignedIn;
//             if (isSignedIn) {
//               return '/';
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//     return _router!;
//   }
// }

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
