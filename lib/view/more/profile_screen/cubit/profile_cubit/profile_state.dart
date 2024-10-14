part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class NoTokenState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final ProfileSuccessResponseModel profile;

  ProfileSuccessState({required this.profile});
}

class ProfileErrorState extends ProfileState {
  final String? message;

  ProfileErrorState({this.message});
}
