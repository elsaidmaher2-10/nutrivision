import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(const LoginInitial());

  final AuthRepository _authRepo;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoading());
    final result = await _authRepo.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (credential) => emit(LoginSuccess(credential)),
    );
  }

  void reset() => emit(const LoginInitial());
}
