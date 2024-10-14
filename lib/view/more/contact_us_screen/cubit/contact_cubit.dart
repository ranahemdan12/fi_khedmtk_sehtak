
import 'package:fi_khedmtk_sehtak/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/local/local_data_source.dart';
import '../../../../models/response/more/contact_us_response.dart';
import '../../../../shared/statics/service_locator.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({required this.repository}) : super(ContactInitial());

  Repository repository;
  GetContactUsResponse? getContactUsResponse;

  static ContactCubit get(context) => BlocProvider.of(context);



  getContact() async {
    emit(ContactLoading());
    String token = sl<LocalDataSource>().getToken();
    if(token.isEmpty){
      emit(ContactLoading());
      return ;
    }




    final contactOrFailure = await repository.getContactUs();
           contactOrFailure.fold(
            (failure) => emit(ContactError(message: failure.message ?? '')),
            (success) {
              getContactUsResponse=success;
              emit(ContactSuccess(getContactUsResponse: success));
        },
      );

  }


}
