part of 'forget_password_otp_cubit.dart';

@immutable
sealed class ForgetPasswordOtpState {}

final class OtpInitial extends ForgetPasswordOtpState {}

//otp
final class OtpLoading extends ForgetPasswordOtpState {}

final class OtpSuccess extends ForgetPasswordOtpState {
  final VerifyOtpResponseModel otpResponseModel;

  OtpSuccess({required this.otpResponseModel});
}

final class OtpFailure extends ForgetPasswordOtpState {
  final String message;

  OtpFailure({required this.message});
}

//resetPassword

final class ResetPassLoading extends ForgetPasswordOtpState {}

final class ResetPassSuccess extends ForgetPasswordOtpState {
  final String? message;

  ResetPassSuccess({this.message});
}

final class ResetPassFailure extends ForgetPasswordOtpState {
  final String? message;

  ResetPassFailure({this.message});
}

final class ResetPassChangePasswordVisibility extends ForgetPasswordOtpState {}

//forgetPassword



final class ForgetPasswordLoading extends ForgetPasswordOtpState {}

final class ForgetPasswordSuccess extends ForgetPasswordOtpState {
  final String? message;

 ForgetPasswordSuccess({this.message});
}

final class ForgetPasswordFailure extends ForgetPasswordOtpState {
  final String? message;

  ForgetPasswordFailure({this.message});
}

