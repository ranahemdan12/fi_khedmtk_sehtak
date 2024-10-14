import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../../../models/request/auth/change_password/change_password_request.dart';
import '../../../../../models/response/auth/change_password/change_password.dart';
import '../../../../../repository/repository.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.repository}) : super(ChangePasswordInitial());

  final Repository repository;

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  changePassword({
    required ChangePasswordRequest request,
  }) async {
    emit(ChangePasswordLoading());
    final resetPassword = await repository.changePassword(
        request: ChangePasswordRequest(
         confirmPassword: request.confirmPassword,
            newPassword:request.newPassword ,
          oldPassword:request.oldPassword ,
        ));
    resetPassword.fold(
          (failure) {
        emit(ChangePasswordError(message: ''));
      },
          (success) => emit(ChangePasswordSuccess(changePasswordResponse: success)),
    );
  }
}
