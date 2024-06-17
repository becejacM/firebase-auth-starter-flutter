import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_login/feature/authentication/model/user_entity.dart';
import 'package:firebase_login/feature/authentication/service/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService _authService;

  AuthenticationBloc({required AuthService authService})
      : _authService = authService,
        super(AuthenticationInitial()) {
    on<AuthenticationLoggedIn>(_onLoggedIn);
    on<AuthenticationSignedUp>(_onSignedUp);
    on<AuthenticationLoggedOut>(_onLoggedOut);
    on<AuthenticationCheckRequested>(_onCheckRequested);
  }

  void _onLoggedIn(
      AuthenticationLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authService.signIn(
          email: event.email, password: event.password);
      if (user != null) {
        emit(AuthenticationAuthenticated(user));
      } else {
        emit(AuthenticationFailure('Sign in failed'));
      }
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void _onSignedUp(
      AuthenticationSignedUp event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authService.signUp(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        companyName: event.companyName,
      );
      if (user != null) {
        emit(AuthenticationAuthenticated(user));
      } else {
        emit(AuthenticationFailure('Sign up failed'));
      }
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void _onLoggedOut(
      AuthenticationLoggedOut event, Emitter<AuthenticationState> emit) async {
    await _authService.signOut();
    emit(AuthenticationUnauthenticated());
  }

  void _onCheckRequested(AuthenticationCheckRequested event,
      Emitter<AuthenticationState> emit) async {
    final user = await _authService.currentUser;
    if (user != null) {
      emit(AuthenticationAuthenticated(user));
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }
}
