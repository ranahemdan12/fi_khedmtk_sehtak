// // part of 'hospital_reservation_cubit.dart';
// //
// //
// // sealed class HospitalReservationState {}
// //
// // final class HospitalReservationInitial extends HospitalReservationState {}
// //
// // final class HospitalReservationLoading extends HospitalReservationState {}
// //
// // final class HospitalReservationSuccess extends HospitalReservationState {
// //
// //
// //   List<HospitalReservationItem>? reservation;
// //   bool? reachedMax;
// //   int? nextPage;
// //   String? error;
// //   HospitalReservationSuccess({ this.reservation, this.reachedMax, this.nextPage,this.error});
// //   HospitalReservationSuccess copyWith({List<HospitalReservationItem>? reservation,bool? reachedMax}){
// //     return HospitalReservationSuccess(nextPage: nextPage,reservation:reservation??this.reservation ,reachedMax: reachedMax??this.reachedMax,
// //     );
// //   }
// // }
//
// final class HospitalReservationEmpty extends HospitalReservationState {}
//
// final class HospitalReservationError extends HospitalReservationState {
//   final String error;
//   HospitalReservationError({required this.error});
// }
