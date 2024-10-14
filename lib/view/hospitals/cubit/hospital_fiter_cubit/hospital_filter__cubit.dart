import 'package:flutter_bloc/flutter_bloc.dart';
part 'hospital_filter__state.dart';



class HospitalFilterCubit extends Cubit<HospitalFilterState> {
  HospitalFilterCubit() : super(HospitalFilterInitial());

  static HospitalFilterCubit get(context) =>BlocProvider.of(context);


  bool validate({int? city, int? region}) {

    return (city != null || region != null);
  }


  int? city;
  int? region;
  setCityRegion(int? city,int? region){
    this.region=region;
    this.city=city;
    emit(HospitalFilterResetState());
  }


  resetCityRegion(){
    region=null;
    city=null;
    emit(HospitalFilterResetState());
  }


}
