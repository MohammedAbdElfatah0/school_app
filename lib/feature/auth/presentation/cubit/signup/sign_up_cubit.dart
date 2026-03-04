import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

part 'sign_up_status.dart';

class SignUpCubit extends Cubit<SignUpStatus> {
  SignUpCubit(this._authRepo) : super(SignUpInitialState());

  //remote data source
  final AuthRepo _authRepo;

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    //loading
    emit(SignUpLoadingState());
    //success or failure
    try {
      final result = await _authRepo.signUp(
        fullName: fullName,
        email: email,
        password: password,
      );
      result.fold(
        (failure) => emit(SignUpFailureState(failure)),
        (_) => emit(SignUpSuccessState()),
      );
    } on Exception catch (e) {
      emit(SignUpFailureState(e.toString()));
    }
  }
}
