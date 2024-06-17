import 'package:auto_route/auto_route.dart';
import 'package:firebase_login/feature/authentication/screens/create_account.dart';
import 'package:firebase_login/feature/authentication/screens/login.dart';
import 'package:firebase_login/feature/home/screens/home.dart';
import 'package:flutter/cupertino.dart';

import 'auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, guards: [AuthGuard]),
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: CreateAccountPage),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
}
