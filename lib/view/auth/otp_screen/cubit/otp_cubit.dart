import 'package:fi_khedmtk_sehtak/shared/statics/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../models/request/auth/verify_otp/verify_otp_req_model.dart';
import '../../../../models/response/auth/verify_otp/verify_otp_res_model.dart';
import '../../../../repository/repository.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit({required this.repository,this.phone}) : super(OtpInitial());
  final Repository repository;
   String? phone;
  static OtpCubit get(context) => BlocProvider.of(context);


  verifyOtp({
    required String request,
  }) async {
    emit(OtpLoading());
    final verifyOtp = await repository.verifyOtpRequest(requestModel: VerifyOtpRequestModel(otp: request,phone: phone,action: Constants.register));
    verifyOtp.fold(
          (failure) {
        emit(OtpFailure(message: failure.message ?? ''));
      },
          (success) {

        emit(OtpSuccess(otpResponseModel: success));
      },
    );
  }
}
