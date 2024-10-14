import 'package:fi_khedmtk_sehtak/models/response/get_ads/get_ads_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/request/get_ads/get_ads.dart';
import '../../../../repository/repository.dart';




part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit({required this.repository,}) : super(AdsInitial());

  Repository repository;

  static AdsCubit get(context) => BlocProvider.of(context);

  List<AdsModelItem> adsList = [];
  int next = 1;
  bool reachedMax = false;

  resetAds() {
    next = 1;
    adsList = [];
    reachedMax = false;
  }


  getAds({ bool? reset,}) async {
    reset == true ? {resetAds()} : {};

    if (!reachedMax || adsList.isEmpty) {
      adsList.isEmpty
          ? {emit(AdsInitial()),}
          : {};

      print("next is :{$next}");
      final adsOrFailure = await repository.getAds(
          request:
          GetAdsRequest(page: next,));
      adsOrFailure.fold(
            (failure) =>
            emit(adsList.isEmpty
                ? AdsErrorState(message: failure.message ?? '')
                : AdsSuccessState(
                error: failure.message ?? '',
                adsList: adsList,
                reachedMax: reachedMax,
                nextPage: next)


            ),
            (success) {
          reachedMax = success.next != null ? false : true;

          if (success.next != null) {
            RegExp regEx = RegExp(r'page=(\d+)');
            Match? match = regEx.firstMatch(success.next ?? "");
            if (match != null) {
              String? pageNumber = match.group(1);
              int? parsedNumber = int.tryParse(pageNumber.toString());
              next = parsedNumber ?? 0;
            }
          } else {
            next = 1;
          }
          adsList.addAll(success.result?.results ?? []);
          print("next is :{$next}");
          emit(adsList.isEmpty
              ? AdsEmptyState()
              : AdsSuccessState(
              adsList: adsList,
              reachedMax: reachedMax,
              nextPage: next));
        },
      );
    } else {
      emit(state);

      // emit(AdsLoadingState());
      // String token = sl<LocalDataSource>().getToken();
      // if(token.isEmpty){
      //   emit(AdsEmptyState());
      //   return;
      // }
      //


    }
  }
}