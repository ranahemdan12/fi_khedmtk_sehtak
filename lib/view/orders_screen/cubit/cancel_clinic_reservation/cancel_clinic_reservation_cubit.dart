

import 'package:flutter_bloc/flutter_bloc.dart';




import '../../../../models/request/clinic/confirm_doctor_reservation/confirm_reservation.dart';
import '../../../../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../../../../repository/repository.dart';

part 'cancel_clinic_reservation_state.dart';

class CancelClinicReservationCubit extends Cubit<CancelClinicReservationState> {
  CancelClinicReservationCubit({required this.repository}) : super(CancelClinicReservationInitial());
  Repository repository;

  static CancelClinicReservationCubit get(context) => BlocProvider.of(context);

  DoctorReservationItem? doctorReservationItem;


cancelClinicReservation({required orderId}) async {

  emit(CancelClinicReservationLoading(id: orderId));

  final cancelReservationClinic = await repository.cancelClinicReservation(

      appointmentId: orderId);

  cancelReservationClinic.fold((l
      ) {
    emit(CancelClinicReservationError( error: l.message?? ''));
  }, (r) {
    emit(CancelClinicReservationSuccess(doctorReservationItem: r));
  });
}


confirmClinicReservation({required orderId})async{

  emit(CancelClinicReservationLoading(id: orderId));
  final confirmReservationClinic = await repository.postConfirmDoctorReservation(
      request: ConfirmReservationRequest(id: orderId));
  confirmReservationClinic.fold((l){
    emit(CancelClinicReservationError(error: l.message?? ''));
  }, (r){
    emit(CancelClinicReservationConfirmSuccess(doctorReservationItem: r));
  });
}
}
