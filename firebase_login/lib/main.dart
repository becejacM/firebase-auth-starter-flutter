import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app/navigation/app.dart';
import 'feature/authentication/bloc/authentication_bloc.dart';
import 'feature/authentication/service/auth_service.dart';
import 'feature/authentication/service/firebase_auth_service.dart';
import 'package:firebase_login/feature/authentication/service/firebase_auth_service.dart';
import 'package:firebase_login/feature/authentication/service/auth_service.dart';
import 'package:firebase_login/feature/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_login/core/app/navigation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    final AuthService authService = AuthService(firebaseAuthService: firebaseAuthService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(authService: authService)..add(AuthenticationCheckRequested()),
        ),
      ],
      child: MyAppWithRouter(),
    );
  }
}
