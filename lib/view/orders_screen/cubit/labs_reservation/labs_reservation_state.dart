// part of 'labs_reservation_cubit.dart';
//
//
// sealed class LabsReservationState {}
//
// final class LabsReservationInitial extends LabsReservationState {}
//
// final class LabsReservationLoading extends LabsReservationState {}
//
// final class LabsReservationSuccess extends LabsReservationState {
//   List<ReserveLabServiceSuccessResponse>? reservation;
//   bool? reachedMax;
//   int? nextPage;
//   String? error;
//   LabsReservationSuccess({ this.reservation, this.reachedMax, this.nextPage,this.error});
//   LabsReservationSuccess copyWith({List<ReserveLabServiceSuccessResponse>? reservation,bool? reachedMax}){
//     return LabsReservationSuccess(nextPage: nextPage,reservation:reservation??this.reservation ,reachedMax: reachedMax??this.reachedMax,
//     );
//   }
// }
//
// final class LabsReservationEmpty extends LabsReservationState {}
//
// final class LabsReservationError extends LabsReservationState {
//   final String error;
//   LabsReservationError({required this.error});
// }
//
