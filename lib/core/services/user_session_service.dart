import 'package:firebase_auth/firebase_auth.dart';

/// Tracks current user session state.
class UserSessionService {
  UserSessionService(this._auth);

  final FirebaseAuth _auth;

  bool get isLoggedIn => _auth.currentUser != null;
  String? get userId => _auth.currentUser?.uid;
  String? get userEmail => _auth.currentUser?.email;
  String? get displayName => _auth.currentUser?.displayName;

  Stream<User?> get sessionStream => _auth.authStateChanges();
}
