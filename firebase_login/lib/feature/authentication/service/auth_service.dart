import 'firebase_auth_service.dart';
import 'package:firebase_login/feature/authentication/model/user_entity.dart';

class AuthService {
  final FirebaseAuthService _firebaseAuthService;

  AuthService({required FirebaseAuthService firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  Future<UserEntity?> signIn({required String email, required String password}) {
    return _firebaseAuthService.signIn(email: email, password: password);
  }

  Future<UserEntity?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) {
    return _firebaseAuthService.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
    );
  }

  Future<void> signOut() {
    return _firebaseAuthService.signOut();
  }

  Future<UserEntity?> get currentUser => _firebaseAuthService.currentUser;

  Stream<UserEntity?> authStateChanges() => _firebaseAuthService.authStateChanges();
}
