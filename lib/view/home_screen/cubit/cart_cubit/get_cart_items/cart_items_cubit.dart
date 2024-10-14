import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../data/local/local_data_source.dart';
import '../../../../../models/response/cart/get_cart_items.dart';
import '../../../../../repository/repository.dart';
import '../../../../../shared/statics/service_locator.dart';
part 'cart_items_state.dart';





class CartItemsCubit extends Cubit<CartItemsState> {
  CartItemsCubit({required this.repository}) : super(CartItemsInitial());

  Repository repository;
  GetCartItemsResponse? getCartItemsResponse;

  static CartItemsCubit get(context) => BlocProvider.of(context);


  getCartItems()async {
    emit(CartItemsLoading());

    String token = sl<LocalDataSource>().getToken();
    if(token.isEmpty){
      emit(CartItemsEmpty());
      return ;
    }


    final cartItemsOrFailure = await repository.getCartItems();
    cartItemsOrFailure.fold(
            (failure) => emit(CartItemsError( error: failure.message?? '')),
            (success) {
              // getCartItemsResponse = success
              // ;
              success.result?.resultItem.isEmpty==true?
              emit(CartItemsEmpty()) :
          emit(CartItemsSuccess(getCartItemsResponse: success));
        }); }}





