import 'package:auto_route/auto_route.dart';
// import 'package:go_router/go_router.dart';
import 'package:firebase_login/feature/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_login/feature/base/bloc/base_bloc.dart';
import 'package:firebase_login/feature/base/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app/navigation/app_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthenticationBloc, AuthenticationState>(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            final user = state.user;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${user.firstName} ${user.lastName}'),
                Text('Company: ${user.companyName}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLoggedOut());
                    context.read<BaseBloc>().add(BaseLoadingEvent());
                    context.router.replace(LoginRoute());
                  },
                  child: Text('Logout'),
                ),
              ],
            );
          } else if (state is BaseLoading) {
            return SizedBox.shrink();
          }
          return Center(child: Text('Something went wrong!'));
        },
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
        }
      },
    );
  }
}
