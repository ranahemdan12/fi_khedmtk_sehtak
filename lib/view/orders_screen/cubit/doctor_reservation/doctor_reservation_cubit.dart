// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../models/request/clinic/get_doctor_reservation/get_doctor_reservation.dart';
// import '../../../../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
// import '../../../../repository/repository.dart';
// part 'doctor_reservation_state.dart';
//
//
//
//
// class DoctorReservationCubit extends Cubit<DoctorReservationState> {
//   DoctorReservationCubit({required this.repository}) : super(DoctorReservationInitial());
//   Repository repository;
//
//   static DoctorReservationCubit get(context) => BlocProvider.of(context);
//
//   List<DoctorReservationItem> reservation = [];
//   int next = 1;
//   bool reachedMax = false;
//
//   resetDoctorReservation() {
//     next = 1;
//     reservation = [];
//     reachedMax = false;
//   }
//
//
//   reserveDoctor(
//       {bool? reset,}) async {
//     reset == true ? {resetDoctorReservation()} : {};
//
//     if (!reachedMax || reservation.isEmpty) {
//       reservation.isEmpty
//           ? {
//         emit(DoctorReservationLoading()),
//       }
//           : {};
//
//
//       final reserveOrFailure =
//       await repository.getDoctorReservation(
//           requestModel: GetDoctorReservationRequest(page: next)
//       );
//       reserveOrFailure.fold(
//             (failure) =>
//             emit(reservation.isEmpty
//                 ? DoctorReservationError(error: failure.message ?? '')
//                 : DoctorReservationSuccess(error: failure.message??'',
//                 reservation: reservation,
//                 reachedMax: reachedMax,
//                 nextPage: next)
//             ),
//             (success) {
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
//           reservation.addAll(success.result?.reservationItem?? []);
//           emit(reservation.isEmpty
//               ? DoctorReservationEmpty()
//               : DoctorReservationSuccess(
//               reservation: reservation,
//               reachedMax: reachedMax,
//               nextPage: next));
//         },
//       );
//     } else {
//       emit(state);
//     }
//   }
//
//
//
//
//   updateOrderStates({int? orderTd,String? states,}){
//     if(state is DoctorReservationSuccess && reservation.isNotEmpty){
//       reservation.firstWhere((element) {
//         return element.id==orderTd;
//       },).reservationStatus=states;
//       emit( DoctorReservationSuccess(
//           reservation: reservation,
//           reachedMax: reachedMax,
//           nextPage: next));
//     }
//
//
//   }
//
// }