part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {
  final ChangePasswordResponse changePasswordResponse;
  ChangePasswordSuccess({required this.changePasswordResponse});
}

final class ChangePasswordError extends ChangePasswordState {
  final String? message;

  ChangePasswordError({this.message});
}
