part of 'cancel_labs_reservation_cubit.dart';


sealed class CancelLabsReservationState {}

final class CancelLabsReservationInitial extends CancelLabsReservationState {}

final class CancelLabsReservationLoading extends CancelLabsReservationState {
  int? id;
  CancelLabsReservationLoading({this.id});
}

final class CancelLabsReservationSuccess extends CancelLabsReservationState {
  ReserveLabServiceSuccessResponse reserveLabServiceSuccessResponse;
  CancelLabsReservationSuccess({required this.reserveLabServiceSuccessResponse});
}
final class CancelLabsReservationConfirmSuccess extends CancelLabsReservationState {
  ReserveLabServiceSuccessResponse reserveLabServiceSuccessResponse;
  CancelLabsReservationConfirmSuccess({required this.reserveLabServiceSuccessResponse});

}

final class CancelLabsReservationEmpty extends CancelLabsReservationState {}

final class CancelLabsReservationError extends CancelLabsReservationState {
  final String error;
  CancelLabsReservationError({required this.error});
}
