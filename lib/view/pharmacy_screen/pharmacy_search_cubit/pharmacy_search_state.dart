part of 'pharmacy_search_cubit.dart';


sealed class PharmacySearchState {}

final class PharmacySearchInitial extends PharmacySearchState {}


class PharmacySearchLoadingState extends PharmacySearchState {}

class PharmacySearchEmptyState extends PharmacySearchState {
  PharmacySearchEmptyState();
}

class PharmacySearchSuccessState extends PharmacySearchState {
  GetPharmacyResponse model;


  PharmacySearchSuccessState({required this.model});
}

class PharmacySearchErrorState extends PharmacySearchState {
  final String? message;

  PharmacySearchErrorState({this.message});
}