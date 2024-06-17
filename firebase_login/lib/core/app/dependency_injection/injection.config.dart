// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../feature/authentication/bloc/authentication_bloc.dart' as _i7;
import '../../../feature/authentication/service/auth_service.dart' as _i6;
import '../../../feature/authentication/service/firebase_auth_service.dart'
    as _i5;
import '../../../feature/base/bloc/base_bloc.dart' as _i4;
import '../navigation/auth_guard.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthGuard>(() => _i3.AuthGuard());
  gh.factory<_i4.BaseBloc>(() => _i4.BaseBloc());
  gh.factory<_i5.FirebaseAuthService>(() => _i5.FirebaseAuthService());
  gh.factory<_i6.AuthService>(() =>
      _i6.AuthService(firebaseAuthService: get<_i5.FirebaseAuthService>()));
  gh.factory<_i7.AuthenticationBloc>(
      () => _i7.AuthenticationBloc(authService: get<_i6.AuthService>()));
  return get;
}
