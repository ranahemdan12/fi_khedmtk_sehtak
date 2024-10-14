import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'payment_filter_state.dart';

class PaymentFilterCubit extends Cubit<PaymentFilterState> {
  PaymentFilterCubit() : super(PaymentFilterInitial());

  static PaymentFilterCubit get(context) => BlocProvider.of(context);

  bool validate() {
    return (
        payment.isNotEmpty );
  }

  String payment = '';
  setPayment(String selected) {
    payment = selected;
    emit(PaymentFilterResetState());
  }

}
