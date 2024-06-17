import 'package:auto_route/auto_route.dart';
import 'package:firebase_login/core/app/navigation/app_router.dart';
import 'package:firebase_login/feature/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final context = router.navigatorKey.currentContext;

    if (context == null) {
      resolver.next(false);
      return;
    }

    final authBloc =
        BlocProvider.of<AuthenticationBloc>(context, listen: false);

    final state = authBloc.state;

    if (state is AuthenticationAuthenticated) {
      resolver.next(true);
    } else if (state is AuthenticationUnauthenticated) {
      router.push(LoginRoute()).then((value) {
        resolver.next(value == true);
      });
    } else {
      router.push(LoginRoute()).then((value) {
        resolver.next(value == true);
      });
    }
  }
}
