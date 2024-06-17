import 'package:auto_route/auto_route.dart';
import 'package:firebase_login/core/app/navigation/app_router.dart';
import 'package:firebase_login/feature/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_login/feature/base/bloc/base_bloc.dart';
import 'package:firebase_login/feature/base/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthenticationBloc, AuthenticationState>(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _companyNameController,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
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
                final firstName = _firstNameController.text;
                final lastName = _lastNameController.text;
                final companyName = _companyNameController.text;
                context.read<AuthenticationBloc>().add(AuthenticationSignedUp(
                  email: email,
                  password: password,
                  firstName: firstName,
                  lastName: lastName,
                  companyName: companyName,
                ));
                context.read<BaseBloc>().add(BaseLoadingEvent());
              },
              child: Text('Create Account'),
            ),
            TextButton(
              onPressed: () {
                context.router.push(LoginRoute());
              },
              child: Text('Login'),
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


