part of 'about_cubit.dart';


sealed class AboutState {}

final class AboutInitial extends AboutState {}
final class  AboutLoading extends AboutState {}

final class  AboutSuccess extends AboutState {
 final GetAboutUsResponse getAboutUsResponse;
 AboutSuccess({required this.getAboutUsResponse});
}

final class  AboutEmpty extends AboutState {}

final class  AboutError extends AboutState {
  final String message;
  AboutError({required this.message});
}
