import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/request/hospitals/cancel_hospital_reservation.dart';
import '../../../../models/request/hospitals/confirm_hospital_reservation.dart';
import '../../../../models/response/hospitals/get_hospital_reservation.dart';
import '../../../../repository/repository.dart';
part 'cancel_hospital_reservation_state.dart';

class CancelHospitalReservationCubit extends Cubit<CancelHospitalReservationState> {
  CancelHospitalReservationCubit({required this.repository}) : super(CancelHospitalReservationInitial());

  Repository repository;

  static CancelHospitalReservationCubit get(context) => BlocProvider.of(context);

  HospitalReservationItem? hospitalReservationItem;

  cancelHospitalReservation({required orderId}) async {
    emit(CancelHospitalReservationLoading(id: orderId));
    final cancelReservationHospital = await repository.cancelHospitalReservation(request: CancelHospitalReservationRequest(id: orderId));
    cancelReservationHospital.fold((l) {
      emit(CancelHospitalReservationError( error: l.message?? ''));
    }, (r) {
      emit(CancelHospitalReservationSuccess( hospitalReservationItem:r));
    });
  }

  confirmHospitalReservation({required orderId})async{

    emit(CancelHospitalReservationLoading(id: orderId));
    final confirmReservationClinic = await repository.postConfirmHospitalReservation(
        request: ConfirmHospitalReservationRequest(id: orderId));
    confirmReservationClinic.fold((l){
      emit(CancelHospitalReservationError(error: l.message?? ''));
    }, (r){
      emit(CancelHospitalConfirmReservationSuccess(hospitalReservationItem: r));
    });
  }


}
