part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {
  int? id;
  AddToCartLoading( { this.id});
}

final class AddToCartSuccess extends AddToCartState {

  int? id;
  AddToCartSuccess({ this.id});

}

final class AddToCartError extends AddToCartState {
  final String error;
  AddToCartError({required this.error});
}

