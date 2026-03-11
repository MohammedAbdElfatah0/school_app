import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

part 'login_status.dart';

class LoginCubit extends Cubit<LoginStatus> {
  LoginCubit(this._authRepo) : super(LoginInitialState());

  //remote data source
  final AuthRepo _authRepo;

  Future<void> login({required String email, required String password}) async {
    //loading
    emit(LoginLoadingState());
    //success or failure
    try {
      final result = await _authRepo.signIn(email: email, password: password);

      result.fold(
        (failure) => emit(LoginFailureState(failure)),
        (_) => emit(LoginSuccessState()),
      );
    } on Exception catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      final result = await _authRepo.signOut();
      result.fold(
        (failure) => emit(LoginFailureState(failure)),
        (_) => emit(LoginSuccessState()),
      );
    } on Exception catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
