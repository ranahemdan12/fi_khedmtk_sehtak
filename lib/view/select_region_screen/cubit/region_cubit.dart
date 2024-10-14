import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/request/get_region/get_region_request.dart';
import '../../../models/response/get_citiy/get_city_response.dart';
import '../../../models/response/get_region/get_region_response.dart';
import '../../../repository/repository.dart';
import '../../../shared/statics/enum.dart';
part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit({ this.repository}) : super(RegionInitial());

  Repository? repository;
  CityItem? selectedCity;
  RegionItem? selectedRegion;
  List<RegionItem>? regionItem;
/* SelectedTab? selectedTab;*/

  static RegionCubit get(context) => BlocProvider.of(context);

  getRegion({required GetRegionReqModel request,}) async {
    emit(RegionLoading());

    final getCities = await repository?.getCities(requestModel: request);
    getCities?.fold((failure) => emit(RegionErrorState(message: failure.message)),
        (success) {
      regionItem = success.regionItem;
      emit(RegionSuccessState(model: success));
    });
  }

  resetRegion() {
    emit(RegionSuccessState(
        model: GetRegionResponse(regionItem: regionItem ?? [])));
  }

  filterRegion({required String filterVal}) {
    final stata = state;
    if (stata is RegionSuccessState) {
      List<RegionItem> filtered = [];
      regionItem?.forEach((element) {
        element.regionName?.contains(filterVal) == true
            ? {
                filtered.add(element),
              } : {};
      });
      filtered.isEmpty
          ? emit(RegionEmptyState())
          : emit(RegionSuccessState(
              model: GetRegionResponse(regionItem: filtered)));
    }
  }

  resetSelectedCityRegion(){

    selectedCity=null;
    selectedRegion=null;
  }
}
