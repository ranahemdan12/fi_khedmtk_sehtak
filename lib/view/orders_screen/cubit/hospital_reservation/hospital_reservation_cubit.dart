
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import '../../../../models/request/hospitals/get_hospital_reservation.dart';
//
// import '../../../../models/response/hospitals/get_hospital_reservation.dart';
// import '../../../../repository/repository.dart';
// import '../../../../shared/statics/enum.dart';
//
// part 'hospital_reservation_state.dart';
//
// class HospitalReservationCubit extends Cubit<HospitalReservationState> {
//   HospitalReservationCubit({required this.repository})
//       : super(HospitalReservationInitial());
//
//   Repository repository;
//   static HospitalReservationCubit get(context) => BlocProvider.of(context);
//
//   List<HospitalReservationItem> reservation = [];
//   int next = 1;
//
//   bool reachedMax = false;
//
//   resetHospitalsReservation() {
//     next = 1;
//     reservation = [];
//     reachedMax = false;
//   }
//
//   reserveHospitals({
//     bool? reset,
//
//   }) async {
//     reset == true ? {resetHospitalsReservation()} : {};
// print('${reservation.length} state.reservation');
//     if (!reachedMax || reservation.isEmpty) {
//       reservation.isEmpty
//           ? {
//               emit(HospitalReservationLoading()),
//             }
//           : {};
//       final stopwatch = Stopwatch()..start();
//       final stopwatchRequest = Stopwatch()..start();
//
//
//       final reserveOrFailure = await repository.getHospitalReservation(
//           request: GetHospitalReservationRequest(page: next));
//       stopwatch.stop();
//       print('Function Execution Time : ${stopwatch.elapsed}');
//       reserveOrFailure.fold(
//         (failure) {
//           emit(reservation.isEmpty
//               ? HospitalReservationError(error: failure.message ?? '')
//               : HospitalReservationSuccess(error: failure.message??'',
//                   reservation: reservation,
//                   reachedMax: reachedMax,
//                   nextPage: next));
//         },
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
//           reservation.addAll(success.result?.reservationResultItem ?? []);
//           emit(reservation.isEmpty
//               ? HospitalReservationEmpty()
//               : HospitalReservationSuccess(
//                   reservation: reservation,
//                   reachedMax: reachedMax,
//                   nextPage: next));
//         },
//       );
//       stopwatchRequest.stop();
//       print('Function Execution Time : ${stopwatchRequest.elapsed}');
//     } else {
//       emit(state);
//     }
//   }
//
//   updateOrderStates({int? orderId, String? states}) {
//     if (state is HospitalReservationSuccess && reservation.isNotEmpty) {
//       reservation.firstWhere(
//         (element) {
//           return element.id == orderId;
//         },
//       ).reservationStatus = states;
//
//       emit(HospitalReservationSuccess(
//           reservation: reservation, reachedMax: reachedMax, nextPage: next));
//     }
//   }
// }
