// import 'package:fi_khedmtk_sehtak/models/request/labs/get_labs_reservations.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../models/response/labs/reserve_lab_service_response.dart';
// import '../../../../repository/repository.dart';
// import '../../../../shared/statics/enum.dart';
// part 'labs_reservation_state.dart';
//
//
//
// class LabsReservationCubit extends Cubit<LabsReservationState> {
//   LabsReservationCubit({required this.repository})
//       : super(LabsReservationInitial());
//
//   Repository repository;
//   ServiceType serviceType = ServiceType.lab;
//
//
//   static LabsReservationCubit get(context) => BlocProvider.of(context);
//
//   List<ReserveLabServiceSuccessResponse> reservation = [];
//   int next = 1;
//
//   bool reachedMax = false;
//
//   resetLabsReservation() {
//     next = 1;
//     reservation = [];
//     reachedMax = false;
//   }
//
//   reserveLabs({
//     bool? reset,
//
//   }) async {
//
//     reset == true ? {resetLabsReservation()} : {};
//
//     if (!reachedMax || reservation.isEmpty) {
//       reservation.isEmpty
//           ? {
//               emit(LabsReservationLoading()),
//             }
//           : {};
//       final reserveOrFailure = await repository.getLabReservations(
//           request:
//               GetReservationsRequest(page: next, serviceType: serviceType));
//       reserveOrFailure.fold(
//         (failure) => emit(reservation.isEmpty
//             ? LabsReservationError(error: failure.message )
//             : LabsReservationSuccess(error: failure.message,
//             reservation: reservation,
//             reachedMax: reachedMax,
//             nextPage: next)
//
//
//             ),
//         (success) {
//           reachedMax = success.next != null ? false : true;
//
//           if (success.next != null) {
//             RegExp regEx = RegExp(r'page=(\d+)');
//             Match? match = regEx.firstMatch(success.next ?? "");
//             if (match != null) {
//               String? pageNumber = match.group(1);
//               int? parsedNumber = int.tryParse(pageNumber.toString());
//               next = parsedNumber ?? 0;
//             }
//           } else {
//             next = 1;
//           }
//
//           reservation
//               .addAll(success.labServiceSuccessResponse?.reservationItem ?? []);
//
//           emit(reservation.isEmpty
//               ? LabsReservationEmpty()
//               : LabsReservationSuccess(
//                   reservation: reservation,
//                   reachedMax: reachedMax,
//                   nextPage: next));
//         },
//       );
//     } else {
//       emit(state);
//     }
//   }
//
//   updateOrderStates({int? orderTd, String? states}) {
//     if (state is LabsReservationSuccess && reservation.isNotEmpty) {
//       reservation.firstWhere(
//         (element) {
//           return element.id == orderTd;
//         },
//       ).reservationStatus = states;
//       emit(LabsReservationSuccess(
//           reservation: reservation, reachedMax: reachedMax, nextPage: next));
//     }
//   }
// }
