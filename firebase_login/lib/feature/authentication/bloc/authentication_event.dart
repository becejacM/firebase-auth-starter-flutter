part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationLoggedIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthenticationSignedUp extends AuthenticationEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String companyName;

  AuthenticationSignedUp({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.companyName,
  });

  @override
  List<Object> get props => [email, password, firstName, lastName, companyName];
}

class AuthenticationLoggedOut extends AuthenticationEvent {}

class AuthenticationCheckRequested extends AuthenticationEvent {}
