part of 'patch_profile_cubit.dart';

@immutable
sealed class PatchProfileState {}

final class PatchProfileInitial extends PatchProfileState {}
final class PatchProfileLoading extends PatchProfileState {}
final class PatchProfileSuccess extends PatchProfileState {
  final String message;
  final String name;
  PatchProfileSuccess({required this.message,required this.name});
}

final class PatchProfileError extends PatchProfileState {
  final String message;
  PatchProfileError({required this.message});

}
