// import 'package:fi_khedmtk_sehtak/models/request/labs/reserve_lab_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../models/response/clinic/make_reservation_response.dart';
// import '../../../../models/response/labs/reserve_lab_service_response.dart';
// import '../../../../repository/repository.dart';
// import '../../../../shared/statics/enum.dart';
// part 'reserve_lab_service_state.dart';
//
//
//
//
// class ReserveLabServiceCubit extends Cubit<ReserveLabServiceState> {
//   ReserveLabServiceCubit({required this.repository,})
//       : super(ReserveLabServiceInitialState());
//
//   ServiceType serviceType=ServiceType.lab;
//   Repository repository;
//
//   ReserveLabServiceSuccessResponse? response;
//
//
//   static ReserveLabServiceCubit get(context) => BlocProvider.of(context);
//
//   reserveLab({required ReserveLabServiceRequest request}) async {
//
//     emit(ReserveLabServiceLoadingState(id: request.appointmentId??0));
//
//     final reserveOrFailure =
//         await repository.reserveLabService(request:request,
//         );
//
//     reserveOrFailure.fold(
//       (failure) => emit(ReserveLabServiceErrorState(error: failure.message ?? '')),
//       (r) {
//         emit(ReserveLabServiceSuccessState(model: r,id: request.appointmentId??0));
//
//       },
//     );
//   }
// }
