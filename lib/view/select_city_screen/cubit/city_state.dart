part of 'city_cubit.dart';


sealed class CityState {}

final class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CitySuccessState extends CityState {
  final GetCityResponseModel model;
  CitySuccessState({required this.model});
}
class CityEmptyState extends CityState {

  CityEmptyState();
}
class CityErrorState extends CityState {
  final String? message;
  CityErrorState({this.message});
}