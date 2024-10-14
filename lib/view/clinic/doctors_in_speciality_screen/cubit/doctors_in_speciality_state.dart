part of 'doctors_in_speciality_cubit.dart';


sealed class DoctorsInSpecialityState {}

final class DoctorsInSpecialityInitial extends DoctorsInSpecialityState {}

class DoctorsInSpecialityLoading extends DoctorsInSpecialityState {}

class DoctorsInSpecialityEmptyState extends DoctorsInSpecialityState {
  DoctorsInSpecialityEmptyState();
}

class DoctorsInSpecialitySuccessState extends DoctorsInSpecialityState {

  final List<ClinicsResultItem> clinicsList;
  final bool reachedMax;
  final int nextPage;
  DoctorsInSpecialitySuccessState( {required this.clinicsList,required this.reachedMax,required this.nextPage});
  DoctorsInSpecialitySuccessState copyWith({List<ClinicsResultItem>? clinicsList,bool? reachedMax}){
    return DoctorsInSpecialitySuccessState(nextPage: nextPage,clinicsList:clinicsList??this.clinicsList ,reachedMax: reachedMax??this.reachedMax,);
  }
}

class DoctorsInSpecialityErrorState extends DoctorsInSpecialityState {
  final String? message;

  DoctorsInSpecialityErrorState({this.message});
}

