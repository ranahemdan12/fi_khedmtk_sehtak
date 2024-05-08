part of 'login_cubit.dart';


 class LogInState {
  LoginRequestModel? loginRequestModel;
  LogInState({this.loginRequestModel});
}

 class LogInInitial extends LogInState {}

class LoginLoadingState extends LogInState{}

 class LogInSuccessState extends LogInState {
   LoginResponseModel? loginResponseModel;
   LogInSuccessState({this.loginResponseModel});
 }

 class LogInFiledState extends LogInState {
   String message ;
   LogInFiledState ({required this.message});
 }
