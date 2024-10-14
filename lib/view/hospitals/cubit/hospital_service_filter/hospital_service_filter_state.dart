part of 'hospital_service_filter_cubit.dart';


sealed class HospitalServiceFilterState {}

final class HospitalServiceFilterInitial extends HospitalServiceFilterState {}

final class FilterResetState extends HospitalServiceFilterState {}
