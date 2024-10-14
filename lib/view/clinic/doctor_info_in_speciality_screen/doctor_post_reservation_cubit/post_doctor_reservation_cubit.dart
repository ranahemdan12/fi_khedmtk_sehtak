// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../models/request/clinic/post_doctor_reservation/post_doctor_resservation.dart';
// import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
// import '../../../../models/response/clinic/make_reservation_response.dart';
// import '../../../../repository/repository.dart';
// part 'post_doctor_reservation_state.dart';
//
// class PostDoctorReservationCubit extends Cubit<PostDoctorReservationState> {
//   PostDoctorReservationCubit({required this.repository}) : super(PostDoctorReservationInitial());
//
//
//   final Repository repository;
//
//   AppointmentItem? selectedAppointment;
//
//   static PostDoctorReservationCubit get(context) => BlocProvider.of(context);
//
//   postDoctorReservation(
//   {required PostDoctorReservation  request})async{
//     emit(PostDoctorReservationLoading());
//
//     final postDoctorReservation =await repository.postDoctorReservation(requestModel: request);
//     postDoctorReservation.fold((l) {
//       emit(PostDoctorReservationError(message: l));
//     }, (r) {
//       emit(PostDoctorReservationSuccess(model: r,appointmentId: request.appointmentsId??0));
//     });
//
//
//   }
//
//
//   setSelected({ AppointmentItem? appointmentClinics}) {
//    selectedAppointment = appointmentClinics;
//   }
//
// }
