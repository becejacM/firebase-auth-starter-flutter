import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/feature/base/bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'core/app/dependency_injection/injection.dart';
import 'core/app/navigation/app_router.dart';
import 'core/app/navigation/auth_guard.dart';
import 'feature/authentication/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter(authGuard: getIt<AuthGuard>());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthenticationBloc>()..add(AuthenticationCheckRequested()),
        ),
        BlocProvider(
          create: (context) => getIt<BaseBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
