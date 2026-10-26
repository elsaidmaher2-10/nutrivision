import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authRepo) : super(const ForgotPasswordInitial());

  final AuthRepository _authRepo;

  Future<void> sendResetEmail(String email) async {
    emit(const ForgotPasswordLoading());
    final result = await _authRepo.forgotPassword(email);
    result.fold(
      (failure) => emit(ForgotPasswordFailure(failure.message)),
      (_) => emit(ForgotPasswordSuccessState(email)),
    );
  }

  void reset() => emit(const ForgotPasswordInitial());
}
