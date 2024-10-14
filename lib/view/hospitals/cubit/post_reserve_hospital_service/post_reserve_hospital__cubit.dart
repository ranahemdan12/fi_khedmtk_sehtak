// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../models/request/hospitals/post_hospitals_reservation.dart';
// import '../../../../models/response/clinic/make_reservation_response.dart';
// import '../../../../models/response/hospitals/get_hospital_reservation.dart';
// import '../../../../repository/repository.dart';
// part 'post_reserve_hospital__state.dart';
//
//
//
//
// class PostReserveHospitalCubit extends Cubit<PostReserveHospitalState> {
//   PostReserveHospitalCubit({required this.repository}) : super(PostReserveHospitalInitial());
//   Repository repository;
//
//   HospitalReservationItem? hospitalReservationItem;
//
//
//   static PostReserveHospitalCubit get(context) => BlocProvider.of(context);
//
//   reserveHospital({required PostHospitalReservationRequest request}) async {
//
//     emit(PostReserveHospitalLoading(id: request.appointmentId??0));
//
//     final reserveHospitalOrFailure =
//     await repository.postHospitalReservation(request:request,);
//     reserveHospitalOrFailure.fold(
//           (failure) => emit(PostReserveHospitalError(error: failure.message ?? '')),
//           (r) {
//         emit(PostReserveHospitalSuccess(model: r,id:request.appointmentId??0));
//
//       },
//     );
//   }
// }
