import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService([this._auth]);

  final FirebaseAuth? _auth;

  User? get currentUser => _auth?.currentUser;
  Stream<User?> get authStateChanges =>
      _auth?.authStateChanges() ?? const Stream.empty();

  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) {
    if (_auth == null) {
      throw FirebaseAuthException(
        code: 'app-not-initialized',
        message: 'خدمة المصادقة غير متصلة حالياً',
      );
    }
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> registerWithEmail({
    required String email,
    required String password,
  }) {
    if (_auth == null) {
      throw FirebaseAuthException(
        code: 'app-not-initialized',
        message: 'خدمة المصادقة غير متصلة حالياً',
      );
    }
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth?.sendPasswordResetEmail(email: email);
  }

  Future<void> updateDisplayName(String name) async {
    await _auth?.currentUser?.updateDisplayName(name);
  }

  Future<void> signOut() async => _auth?.signOut();
}
