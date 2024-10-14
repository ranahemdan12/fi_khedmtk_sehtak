part of 'region_cubit.dart';


sealed class RegionState {}

final class RegionInitial extends RegionState {}

class RegionLoading extends RegionState {}

class RegionEmptyState extends RegionState {
  RegionEmptyState();
}

class RegionSuccessState extends RegionState {
  final GetRegionResponse model;
  CityItem? selected;
  RegionSuccessState({required this.model, this.selected});
}


class RegionErrorState extends RegionState {
  final String? message;
  RegionErrorState({this.message});
}
