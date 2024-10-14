import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
part 'doctor_filter_state.dart';


class DoctorFilterCubit extends Cubit<DoctorFilterState> {
  DoctorFilterCubit() : super(DoctorFilterInitial());

  static DoctorFilterCubit get(context) => BlocProvider.of(context);

  GetClinicsBySpecialityResponse getClinicsBySpecialityResponse =
      GetClinicsBySpecialityResponse();

  List<int> selectedSubSpecializations = [];
  bool validate() {
    return (selectedSubSpecializations.isNotEmpty ||
        gender.isNotEmpty || title.isNotEmpty ||
        minFees != null || maxFees != null);
  }

  toggleSelected(int id) {
    if (selectedSubSpecializations.contains(id)) {
      selectedSubSpecializations.remove(id);
    } else {
      selectedSubSpecializations.add(id);
    }

    emit(DoctorFilterInitial());
  }

  removeId(int id) {
    selectedSubSpecializations.remove(id);
    emit(DoctorFilterInitial());
  }

  resetSubSubSpeciality() {
    selectedSubSpecializations = [];
    emit(FilterResetState());
  }

  late RangeValues currentRangeValues;

  double? minFees;
  double? maxFees;
  resetFilter({double? minFees, double? maxFees}) {
    reset();
    resetTitle();
    resetMinFees(minFees, maxFees);
    resetSubSubSpeciality();
  }

  setMinMaxFees(double? minFees, double? maxFees,bool selected) {
    if(selected){
      this.minFees = minFees;
      this.maxFees = maxFees;
    }

     currentRangeValues = RangeValues(minFees ?? 0.0, maxFees ?? 0.0);
    emit(DoctorFilterInitial());
  }

  resetMinFees(double? minFees, double? maxFees) {
    this.minFees = null;
    this.maxFees = null;
    currentRangeValues = RangeValues(minFees ?? 0, maxFees ?? 0.0);
    emit(FilterResetState());
  }

  String gender = '';
  setGender(String selected) {
    gender = selected;
    emit(DoctorFilterInitial());
  }

  reset() {
    gender = '';
    emit(FilterResetState());
  }

  String title = '';
  setTitle(String selected) {
    title = selected;
    emit(DoctorFilterInitial());
  }

  resetTitle() {
    title = '';
    emit(FilterResetState());
  }

  String orderBy = '';
  setOrderBy(String doctorSort) {
    orderBy = doctorSort;
    emit(DoctorFilterInitial());
  }

  resetOrderBy() {
    orderBy = '';
    emit(FilterResetState());
  }
}
