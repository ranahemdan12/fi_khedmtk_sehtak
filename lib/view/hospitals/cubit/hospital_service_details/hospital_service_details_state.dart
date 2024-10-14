part of 'hospital_service_details_cubit.dart';


sealed class HospitalServiceDetailsState {}

final class HospitalServiceDetailsInitial extends HospitalServiceDetailsState {}


final class HospitalServiceDetailsLoading extends HospitalServiceDetailsState {}

final class HospitalServiceDetailsEmptyState extends HospitalServiceDetailsState {
  HospitalServiceDetailsEmptyState();}

final class HospitalServiceDetailsSuccess extends HospitalServiceDetailsState {

  final List<BranchServiceResultItem> branchesServiceList;
  final bool reachedMax;
  final int nextPage;
  HospitalServiceDetailsSuccess( {required this.branchesServiceList,required this.reachedMax,required this.nextPage});
  HospitalServiceDetailsSuccess copyWith({List<BranchServiceResultItem>? branchesServiceList,bool? reachedMax}){
    return HospitalServiceDetailsSuccess(nextPage: nextPage,branchesServiceList:branchesServiceList??this.branchesServiceList ,reachedMax: reachedMax??this.reachedMax,);
  }

}
final class HospitalServiceDetailsError extends HospitalServiceDetailsState {
  final String? message;
  HospitalServiceDetailsError({this.message});
}

