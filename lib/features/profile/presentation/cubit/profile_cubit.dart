import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/user_profile.dart';
import '../../../../core/services/user_session_service.dart';
import '../../domain/repositories/profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo, this._session) : super(const ProfileInitial());

  final ProfileRepository _repo;
  final UserSessionService _session;

  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    final uid = _session.userId ?? 'guest';
    final result = await _repo.getProfile(uid);
    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }

  Future<void> saveProfile({
    required double weight,
    required double height,
    required int age,
  }) async {
    emit(const ProfileUpdating());
    final uid = _session.userId ?? 'guest';
    final profile = UserProfile(
      uid: uid,
      name: _session.displayName ?? '',
      email: _session.userEmail ?? '',
      weightKg: weight,
      heightCm: height,
      age: age,
    );
    final result = await _repo.saveProfile(profile);
    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (_) => emit(const ProfileUpdateSuccess('تم تحديث خطتك بنجاح!')),
    );
  }
}
