import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/user_profile.dart';
import '../../../../core/services/firestore_service.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._firestore);
  final FirestoreService _firestore;

  String _userDoc(String uid) => 'users/$uid';

  @override
  Future<Either<Failure, UserProfile>> getProfile(String userId) async {
    try {
      final doc = await _firestore.getDoc(_userDoc(userId));
      if (doc == null || !doc.exists || doc.data() == null) {
        return Right(UserProfile(uid: userId, name: '', email: ''));
      }
      return Right(UserProfile.fromMap(userId, doc.data()!));
    } catch (e) {
      return Left(ServerFailure('تعذر تحميل الملف الشخصي: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(UserProfile profile) async {
    try {
      await _firestore.setDoc(_userDoc(profile.uid), profile.toMap());
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('تعذر حفظ البيانات: $e'));
    }
  }
}
