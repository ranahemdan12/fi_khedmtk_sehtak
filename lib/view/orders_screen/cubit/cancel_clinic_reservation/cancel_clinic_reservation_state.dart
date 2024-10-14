part of 'cancel_clinic_reservation_cubit.dart';


sealed class CancelClinicReservationState {}
final class CancelClinicReservationInitial extends CancelClinicReservationState {}
final class CancelClinicReservationLoading extends CancelClinicReservationState {
  int? id;

  CancelClinicReservationLoading({required this.id});

}
final class CancelClinicReservationSuccess extends CancelClinicReservationState {
  DoctorReservationItem? doctorReservationItem;
  CancelClinicReservationSuccess({required this.doctorReservationItem});

}

final class CancelClinicReservationConfirmSuccess extends CancelClinicReservationState {
  DoctorReservationItem? doctorReservationItem;
  CancelClinicReservationConfirmSuccess({required this.doctorReservationItem});

}
class CancelClinicReservationEmpty extends CancelClinicReservationState {}
final class CancelClinicReservationError extends CancelClinicReservationState {
  final String error;
  CancelClinicReservationError({required this.error});
}
