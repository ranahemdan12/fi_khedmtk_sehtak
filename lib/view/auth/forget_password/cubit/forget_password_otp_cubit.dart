
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../models/request/auth/forget_password/forget_pass_req_model.dart';
import '../../../../models/request/auth/reset_password/resetpass_req_model.dart';
import '../../../../models/request/auth/verify_otp/verify_otp_req_model.dart';
import '../../../../models/response/auth/verify_otp/verify_otp_res_model.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/constants.dart';


part 'forget_password_otp_state.dart';

class ForgetPasswordOtpCubit extends Cubit<ForgetPasswordOtpState> {
  ForgetPasswordOtpCubit({required this.repository}) : super(OtpInitial());

  final Repository repository;

  static ForgetPasswordOtpCubit get(context) => BlocProvider.of(context);

  String phone = '';
  String otp = '';

  verifyOtp({
    required String otp,
  }) async {
    emit(OtpLoading());
    final verifyOtp = await repository.verifyOtpRequest(requestModel: VerifyOtpRequestModel(
      otp: otp,
      phone: phone,
      action: Constants.resetPasswordOtp));
    verifyOtp.fold(
      (failure) {
        emit(OtpFailure(message: failure.message ?? ''));
      },
      (success) {
        this.otp = otp;
        emit(OtpSuccess(otpResponseModel: success));
      },
    );
  }

  forgetPassword({
    required ForgetPasswordReqModel request,
  }) async {
    emit(ForgetPasswordLoading());
    final forgetPassword =
        await repository.forgetPassword(requestModel: request);
    forgetPassword.fold(
      (failure) {
        emit(ForgetPasswordFailure(message: ''));
      },
      (success) {
        phone = request.phone ?? '';
        emit(ForgetPasswordSuccess());
      },
    );
  }

  resetPassword({
    required String password,
  }) async {
    emit(ResetPassLoading());
    final resetPassword = await repository.resetPassword(
        requestModel: ResetPassRequestModel(
      phone: phone,
      password: password,
      otp: otp,
    ));
    resetPassword.fold(
      (failure) {
        emit(ResetPassFailure(message: ''));
      },
      (success) => emit(ResetPassSuccess()),
    );
  }




  }




