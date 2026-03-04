part of 'sign_up_cubit.dart';

sealed class SignUpStatus {}

class SignUpInitialState extends SignUpStatus {}

class SignUpLoadingState extends SignUpStatus {}

class SignUpSuccessState extends SignUpStatus {}

class SignUpFailureState extends SignUpStatus {
  final String errorMessage;
  SignUpFailureState(this.errorMessage);
}
