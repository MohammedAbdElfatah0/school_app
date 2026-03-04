part of 'login_cubit.dart';

sealed class LoginStatus {}

class LoginInitialState extends LoginStatus {}

class LoginLoadingState extends LoginStatus {}

class LoginSuccessState extends LoginStatus {}

class LoginFailureState extends LoginStatus {
  final String errorMessage;
  LoginFailureState(this.errorMessage);
}
