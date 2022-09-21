import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/screens/start_page.dart';

///  Application routing
class AppRouter {
  AppRouter._();

  /// Router naming constants
  static const String start = '/';

  /// Define [GoRouter] router delegate
  static final GoRouter routerDelegate = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: start,
        builder: (BuildContext context, GoRouterState state) {
          return const StartPage();
        },
      ),
    ],
  );
}
