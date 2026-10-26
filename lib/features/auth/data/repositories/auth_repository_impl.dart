import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/auth_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../helpers/auth_error_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._auth);
  final AuthService _auth;

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() f) async {
    try {
      return Right(await f());
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(AuthErrorMapper.map(e)));
    } catch (e) {
      return Left(AuthFailure('خطأ غير متوقع: $e'));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) =>
      _guard(() => _auth.signInWithEmail(email: email, password: password));

  @override
  Future<Either<Failure, UserCredential>> register({
    required String name,
    required String email,
    required String password,
  }) =>
      _guard(() async {
        final c = await _auth.registerWithEmail(email: email, password: password);
        await _auth.updateDisplayName(name);
        return c;
      });

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) =>
      _guard(() async {
        await _auth.sendPasswordResetEmail(email);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> signOut() =>
      _guard(() async {
        await _auth.signOut();
        return unit;
      });

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> get authState => _auth.authStateChanges;
}
