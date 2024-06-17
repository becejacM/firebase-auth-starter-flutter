import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/feature/authentication/model/user_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserEntity?> signIn(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return await _userFromFirebaseUser(result.user);
  }

  Future<UserEntity?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = result.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'companyName': companyName,
        'email': email,
      });
      return UserEntity(
        id: user.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        imageUrl: '',
        companyName: companyName,
      );
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<UserEntity?> get currentUser =>
      _userFromFirebaseUser(_firebaseAuth.currentUser);

  Stream<UserEntity?> authStateChanges() =>
      _firebaseAuth.authStateChanges().asyncMap(_userFromFirebaseUser);

  Future<UserEntity?> _userFromFirebaseUser(User? user) async {
    if (user == null) return null;
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (doc.exists) {
      final data = doc.data()!;
      return UserEntity(
        id: user.uid,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: user.email ?? '',
        imageUrl: data['imageUrl'] ?? '',
        companyName: data['companyName'] ?? '',
      );
    }
    return null;
  }
}
