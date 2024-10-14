import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/response/get_citiy/get_city_response.dart';
import '../../../repository/repository.dart';
part 'city_state.dart';




class CityCubit extends Cubit<CityState> {
  CityCubit({required this.repository}) : super(CityInitial());
  Repository repository;

  List<CityItem> governoratesResponseModel=[];

  static CityCubit get(context) => BlocProvider.of(context);

  getCity() async {

    emit(CityLoading());

    final getGovernorates = await repository.getGovernorates();
    getGovernorates.fold(
        (failure) => emit(CityErrorState(message: failure.message)),
        (success) {
      governoratesResponseModel = success.cityItem;
      governoratesResponseModel.isEmpty == true
          ? emit(CityEmptyState())
          : emit(CitySuccessState(model: success));

    });
  }

  resetCity() {
    // print('called from reset ');
    emit(CitySuccessState(
        model: GetCityResponseModel(
            cityItem: governoratesResponseModel )));
  }

  filterCity({required String filterVal}) {
    final stata = state;
    if (stata is CitySuccessState) {

      List<CityItem> filtered = [];
      governoratesResponseModel?.forEach((element) {
        element.cityName?.contains(filterVal) == true
            ? {
                filtered.add(element),
              }
            :  {};
        });

      filtered.isEmpty
          ? emit(CityEmptyState())
          : emit(CitySuccessState(
              model: GetCityResponseModel(cityItem: filtered)));
    }
  }
}
