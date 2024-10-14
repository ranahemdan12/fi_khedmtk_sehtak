import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../models/request/cart/add_to_cart.dart';
import '../../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../../repository/repository.dart';
part 'add_to_cart_state.dart';



class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit({required this.repository}) : super(AddToCartInitial());
  Repository repository;

  AppointmentItem? selectedAppointment;

  static AddToCartCubit get(context) => BlocProvider.of(context);

  addToCart({required AddToCartRequest request}) async {

    emit(AddToCartLoading());

    final addToCartOrFailure =
    await repository.addToCart(request:request,);
    addToCartOrFailure.fold(
          (failure) => emit(AddToCartError(error: failure.message ?? '')),
          (r) {
        emit(AddToCartSuccess());

      },
    );
  }


  setSelected({ AppointmentItem? appointmentClinics}) {
    selectedAppointment = appointmentClinics;
  }
}