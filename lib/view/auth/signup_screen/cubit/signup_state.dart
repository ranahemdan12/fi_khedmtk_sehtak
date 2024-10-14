part of 'signup_cubit.dart';


sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccessState extends SignupState {
  final SignUpSuccessResponseModel successResponseModel;
  SignupSuccessState({required this.successResponseModel});
}

final class SignupFailureState extends SignupState {
  final String message ;
  SignupFailureState({required this.message});
}