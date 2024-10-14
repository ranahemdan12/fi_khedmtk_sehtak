part of 'login_cubit.dart';

abstract class LoginState {
  final LoginRequestModel? loginRequestModel;

  const LoginState({this.loginRequestModel});
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginSuccessResponseModel? loginResponseModel;

  const LoginSuccessState({required this.loginResponseModel});
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message});
}
