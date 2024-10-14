import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/request/labs/cancel_lab_reservation.dart';
import '../../../../models/request/labs/confirm_lab_reservation.dart';
import '../../../../models/response/labs/reserve_lab_service_response.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/enum.dart';
part 'cancel_labs_reservation_state.dart';

class CancelLabsReservationCubit extends Cubit<CancelLabsReservationState> {
  CancelLabsReservationCubit({required this.repository}) : super(CancelLabsReservationInitial());

  Repository repository;
  ServiceType serviceType=ServiceType.lab;

  static CancelLabsReservationCubit get(context) => BlocProvider.of(context);

  ReserveLabServiceSuccessResponse? reserveLabServiceSuccessResponse;



  cancelLabsReservation({required orderId,required serviceType}) async {

    emit(CancelLabsReservationLoading(id: orderId));

    final cancelReservationLabs = await repository.cancelLabReservations(

        request:CancelReservationRequest(id:orderId,serviceType: serviceType));

    cancelReservationLabs.fold((l) {

      emit(CancelLabsReservationError( error: l.message?? ''));
    }, (r) {
      emit(CancelLabsReservationSuccess(reserveLabServiceSuccessResponse: r));
    });
  }


  confirmLabsReservation({required orderId,required serviceType})async{

    emit(CancelLabsReservationLoading(id: orderId));
    final confirmReservationLabs = await repository.postConfirmLabReservation(
        request: ConfirmLabReservation(id: orderId, serviceType: serviceType));
    confirmReservationLabs.fold((l){
      emit(CancelLabsReservationError(error: l.message?? ''));
    }, (r){
      emit(CancelLabsReservationConfirmSuccess(reserveLabServiceSuccessResponse: r));
    });
  }
}


