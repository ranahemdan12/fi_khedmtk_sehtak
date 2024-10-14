part of 'cart_items_cubit.dart';

@immutable
sealed class CartItemsState {}

final class CartItemsInitial extends CartItemsState {}

final class CartItemsLoading extends CartItemsState {}

final class CartItemsSuccess extends CartItemsState {
 final  GetCartItemsResponse  getCartItemsResponse;
 CartItemsSuccess({required this.getCartItemsResponse});
}

final class CartItemsEmpty extends CartItemsState {}

final class CartItemsError extends CartItemsState {

  final String error;
  CartItemsError({required this.error});
}