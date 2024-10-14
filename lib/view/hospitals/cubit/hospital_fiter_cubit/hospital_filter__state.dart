part of 'hospital_filter__cubit.dart';


sealed class HospitalFilterState {}

final class HospitalFilterInitial extends HospitalFilterState {}
final class HospitalFilterResetState extends HospitalFilterState {}