part of 'post_checkout_cubit.dart';

@immutable
sealed class PostCheckoutState {}

final class PostCheckoutInitial extends PostCheckoutState {}
final class PostCheckoutLoading extends PostCheckoutState {}

final class PostCheckoutSuccess extends PostCheckoutState {
  final PostCheckOutResponse model;
  PostCheckoutSuccess({required this.model});
}

final class PostCheckoutEmpty extends PostCheckoutState {}

final class PostCheckoutError extends PostCheckoutState {
  final String? message;
  PostCheckoutError({this.message});
}
