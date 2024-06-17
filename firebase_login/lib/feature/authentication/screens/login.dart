import 'package:auto_route/auto_route.dart';
import 'package:firebase_login/core/app/navigation/app_router.dart';
import 'package:firebase_login/feature/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_login/feature/base/bloc/base_bloc.dart';
import 'package:firebase_login/feature/base/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthenticationBloc, AuthenticationState>(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                context.read<AuthenticationBloc>().add(AuthenticationLoggedIn(email: email, password: password));
                context.read<BaseBloc>().add(BaseLoadingEvent());
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(CreateAccountRoute());
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          context.read<BaseBloc>().add(BaseLoadedEvent());
          context.router.replace(HomeRoute());
        } else if (state is AuthenticationFailure) {
          context.read<BaseBloc>().add(BaseLoadedEvent());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        } else if (state is AuthenticationLoading) {
          context.read<BaseBloc>().add(BaseLoadingEvent());
        }
      },
    );
  }
}
