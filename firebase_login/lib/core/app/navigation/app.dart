import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_login/feature/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_login/feature/authentication/screens/login.dart';
import 'package:firebase_login/feature/authentication/screens/create_account.dart';
import 'package:firebase_login/feature/home/screens/home.dart';

class MyAppWithRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return Home();
              } else if (state is AuthenticationUnauthenticated) {
                return Login();
              } else if (state is AuthenticationLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Login();
              }
            },
          ),
        ),
        GoRoute(
          path: '/create_account',
          builder: (context, state) => CreateAccount(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => Home(),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
