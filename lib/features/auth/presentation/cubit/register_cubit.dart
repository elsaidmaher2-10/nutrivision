import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(const RegisterInitial());

  final AuthRepository _authRepo;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const RegisterLoading());
    final result = await _authRepo.register(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (cred) => emit(RegisterSuccess(cred)),
    );
  }

  void reset() => emit(const RegisterInitial());
}
