import 'package:flutter_bloc/flutter_bloc.dart';
part 'hospital_service_filter_state.dart';



class HospitalServiceFilterCubit extends Cubit<HospitalServiceFilterState> {
  HospitalServiceFilterCubit() : super(HospitalServiceFilterInitial());

  static HospitalServiceFilterCubit get(context) =>BlocProvider.of(context);


  bool validate() {
    return ( title.isNotEmpty  );
  }

  String title = '';
  setTitle(String selected){
    title = selected;
    emit(HospitalServiceFilterInitial());
  }

  resetTitle(){
    title = '';
    emit(FilterResetState());
  }

}
