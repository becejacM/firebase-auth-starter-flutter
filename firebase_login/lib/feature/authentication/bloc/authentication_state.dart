part of 'authentication_bloc.dart';

abstract class AuthenticationState extends BaseState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserEntity user;

  AuthenticationAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure(this.error);

  @override
  List<Object> get props => [error];
}
