part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {}


final class OtpSuccess extends OtpState {

  OtpSuccess({required this.otpResponseModel});
  final VerifyOtpResponseModel otpResponseModel;
}

final class OtpFailure extends OtpState {
  OtpFailure({required this.message});
  final String message;
}