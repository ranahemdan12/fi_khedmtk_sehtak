part of 'hospitals_cubit.dart';

sealed class HospitalsState {}

final class HospitalsInitial extends HospitalsState {}

final class HospitalsLoading extends HospitalsState {}

final class HospitalsEmptyState extends HospitalsState {
  HospitalsEmptyState();}

final class HospitalsSuccess extends HospitalsState {

  final List<HospitalResultItem> hospitalsList;
  final bool reachedMax;
  final int nextPage;
  HospitalsSuccess( {required this.hospitalsList,required this.reachedMax,required this.nextPage});
  HospitalsSuccess copyWith({List<HospitalResultItem>? clinicsList,bool? reachedMax}){
    return HospitalsSuccess(nextPage: nextPage,hospitalsList:hospitalsList,reachedMax: reachedMax??this.reachedMax,);
  }

}
final class HospitalsError extends HospitalsState {
  final String? message;
  HospitalsError({this.message});
}
