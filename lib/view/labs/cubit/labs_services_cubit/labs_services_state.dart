part of 'labs_services_cubit.dart';

@immutable
abstract class LabsServicesState {}

class LabsServicesInitialState extends LabsServicesState {}


class LabsServicesLoadingState extends LabsServicesState {}

class LabsServicesLoadedState extends LabsServicesState {
  final List<LabServiceModel> services;
  final bool reachedMax;
  final int nextPage;
  LabsServicesLoadedState({required this.services,required this.reachedMax,required this.nextPage});
  LabsServicesLoadedState copyWith({List<LabServiceModel>? services,bool? reachedMax}){
    return LabsServicesLoadedState(nextPage: nextPage,services:services??this.services ,reachedMax: reachedMax??this.reachedMax,);
  }
}
class LabsServicesEmptyState extends LabsServicesState {}

class LabsServicesErrorState extends LabsServicesState {
  final String error;
  LabsServicesErrorState({required this.error});
}