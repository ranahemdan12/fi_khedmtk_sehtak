import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data/local/local_data_source.dart';
import '../../../../../models/request/cart/post_checkout.dart';
import '../../../../../models/response/cart/post_checkout.dart';
import '../../../../../repository/repository.dart';
import '../../../../../shared/statics/service_locator.dart';

part 'post_checkout_state.dart';

class PostCheckoutCubit extends Cubit<PostCheckoutState> {
  PostCheckoutCubit({required this.repository}) : super(PostCheckoutInitial());

  Repository repository;
  PostCheckOutResponse? postCheckOutResponse;
  static PostCheckoutCubit get(context) => BlocProvider.of(context);

  postCheckOut({required PostCheckOutRequest request})async{

    emit(PostCheckoutLoading());

    String token = sl<LocalDataSource>().getToken();
    if(token.isEmpty){
      emit(PostCheckoutEmpty());
      return ;
    }

    final postCheckOut = await repository.postCheckOut(request: request);

    postCheckOut.fold(
            (failure) => emit(PostCheckoutError(message: failure.message)),
    (success) {
      postCheckOutResponse=success;
      emit(PostCheckoutSuccess( model: success));}
    );

  }



}
