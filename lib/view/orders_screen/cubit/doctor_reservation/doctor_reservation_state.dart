// part of 'doctor_reservation_cubit.dart';
//
//
// sealed class DoctorReservationState {}
//
// final class DoctorReservationInitial extends DoctorReservationState {}
// final class DoctorReservationLoading extends DoctorReservationState {}
// final class DoctorReservationSuccess extends DoctorReservationState {
//
//   List<DoctorReservationItem>? reservation;
//    bool? reachedMax;
//    int? nextPage;
//   String? error;
//   DoctorReservationSuccess({ this.reservation, this.reachedMax, this.nextPage,this.error});
//   DoctorReservationSuccess copyWith({List<DoctorReservationItem>? reservation,bool? reachedMax}){
//     return DoctorReservationSuccess(nextPage: nextPage,reservation:reservation??this.reservation ,reachedMax: reachedMax??this.reachedMax,
//     );
//   }
// }
// class DoctorReservationEmpty extends DoctorReservationState {}
// final class DoctorReservationError extends DoctorReservationState {
//   final String error;
//   DoctorReservationError({required this.error});
// }
