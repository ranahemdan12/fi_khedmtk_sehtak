part of 'cancel_hospital_reservation_cubit.dart';


sealed class CancelHospitalReservationState {}

final class CancelHospitalReservationInitial extends CancelHospitalReservationState {}

final class CancelHospitalReservationLoading extends CancelHospitalReservationState {
  int?id;
  CancelHospitalReservationLoading({required this.id});

}

final class CancelHospitalReservationSuccess extends CancelHospitalReservationState {
  HospitalReservationItem ?  hospitalReservationItem ;
  CancelHospitalReservationSuccess({required  this.hospitalReservationItem});
}

final class CancelHospitalConfirmReservationSuccess extends CancelHospitalReservationState {
  HospitalReservationItem ?  hospitalReservationItem ;
  CancelHospitalConfirmReservationSuccess({required  this.hospitalReservationItem});
}

final class CancelHospitalReservationEmpty extends CancelHospitalReservationState {}

final class CancelHospitalReservationError extends CancelHospitalReservationState {
  final String error;
  CancelHospitalReservationError({required this.error});

}
