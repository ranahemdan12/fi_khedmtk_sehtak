import 'package:fi_khedmtk_sehtak/data/local/local_data_source.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/constants.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/dio_helper.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/notifications_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/request/auth/login/login_request.dart';
import '../../../../models/request/notification/fcm_register_request.dart';
import '../../../../models/response/auth/login/login_response.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/service_locator.dart';
part 'login_state.dart';





class LoginCubit extends Cubit<LoginState> {
  final Repository? repository;
  LoginRequestModel? loginRequestModel;
  LoginSuccessResponseModel? loginResponseModel;

  LoginCubit({required this.repository}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);



  Future<void> login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoadingState());
    final failureOrLoginModel =
        await repository?.login(requestModel: loginRequestModel);
    failureOrLoginModel?.fold(
        (failure) => emit(LoginErrorState(message: failure.message ?? '')),
        (success) async {
      loginResponseModel = success;
      await sl<LocalDataSource>()
          .setData(key: 'phone', value: loginRequestModel.phoneNumber);
      await sl<LocalDataSource>()
          .setData(key: 'password', value: loginRequestModel.password);

      await sl<LocalDataSource>()
          .setData(key: Constants.token, value: success.data.token);
      await sl<LocalDataSource>().disableOnboarding();

      await repository?.postFcm(request: FcmRegisterRequest(registerId:  await NotificationService.fcmToken()));
     
      emit(LoginSuccessState(loginResponseModel: loginResponseModel));


    });
  }

  Future signOut()async{

    await repository?.logout();

    await sl<DioHelper>().logout();
    emit(LoginInitial());
  }

}
