import 'package:fi_khedmtk_sehtak/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/request/auth/sign_up/signup_request.dart';
import '../../../../models/response/auth/sign_up/signup_response.dart';
part 'signup_state.dart';


class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.repository}) : super(SignupInitial());

 static SignupCubit get(context) => BlocProvider.of(context);

  final Repository repository;
  String phone='';
  int  city=0;
  int region =0;

  signup({required SignUpRequestModel request})async{
    emit(SignupLoading());
    phone = request.user?.phone??'';
    city=request.city??0;
        final signup =await repository.signup(requestModel: request);
    signup.fold((l) {
      emit(SignupFailureState(message: l.message??''));
    }, (r) {
      emit(SignupSuccessState(successResponseModel: r));
    });



  }
}
