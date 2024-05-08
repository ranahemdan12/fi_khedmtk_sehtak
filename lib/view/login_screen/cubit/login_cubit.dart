import 'package:bloc/bloc.dart';
import 'package:fi_khedmtk_sehtak/models/response/login_response.dart';


import '../../../models/request/login_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LogInState> {
  LoginCubit() : super(LogInInitial());
}
