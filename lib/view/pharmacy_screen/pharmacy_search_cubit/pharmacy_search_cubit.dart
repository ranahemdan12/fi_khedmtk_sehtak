import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../models/request/filter_locations/filter_locations_request.dart';
import '../../../../models/response/pharmacy/get_pharmacy_response.dart';
import '../../../../repository/repository.dart';
part 'pharmacy_search_state.dart';




class PharmacySearchCubit extends Cubit<PharmacySearchState> {
  PharmacySearchCubit({required this.repository}) : super(PharmacySearchInitial());
  Repository repository;


  List<GetPharmacyItem> resultModel=[];
 String search='';

  static PharmacySearchCubit get(context)=> BlocProvider.of(context);

  late BehaviorSubject<Map<String, dynamic>> searchControllerChannel;

  void initializeSearch() {
    debugPrint('------------------- initializeSearch ------------------');
    searchControllerChannel = BehaviorSubject<Map<String, dynamic>>();
    searchControllerChannel
        .debounce((_) => TimerStream(true, const Duration(seconds: 1)))
        .listen((searchData) {
      debugPrint(
          "------------------------ searchData: $searchData ------------------------");
      getAllPharmacy(searchVal: searchData['searchValue'],city:searchData['searchCity'],region: searchData['searchRegion']);
    });
  }

  getAllPharmacy({String? searchVal,int?city,int?region}) async{

    emit(PharmacySearchLoadingState());

     search = searchVal?? search;

    final getAllPharmacy = await repository.getPharmacy(request:FilterLocationsRequest(
      search:search,city: city,region: region ,
    ));
    getAllPharmacy.fold(
            (failure) => emit(PharmacySearchErrorState(message: failure.message)),
            (success) {
              resultModel=success.resultItem;
          resultModel.isEmpty == true
              ? emit(PharmacySearchEmptyState())
              : emit(PharmacySearchSuccessState(model: success));
        });
  }


  //
  // resetPharmacy(){
  //   resultModel = [];
  //   emit(PharmacySearchSuccessState(model:GetPharmacyResponse(resultItem: resultModel) ));
  // }

  // filterPharmacy({required String filterVal}) {
  //   final stata = state;
  //   if (stata is PharmacySearchSuccessState) {
  //     List<GetPharmacyItem> filtered = [];
  //     resultModel?.forEach((element) {
  //       element.pharmacyName.toString().contains(filterVal) == true
  //           ? {
  //         filtered.add(element),
  //       }:{};
  //     });
  //     filtered.isEmpty
  //         ? emit(PharmacySearchEmptyState())
  //         : emit(PharmacySearchSuccessState( model: GetPharmacyResponse(
  //       resultItem: filtered
  //     )));
  //   }
  // }

  bool validate({int? city, int? region}) {
    return (city!=null || region!=null);
  }
}
