import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/local/local_data_source.dart';
import '../../../../models/response/more/about_us_response.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/service_locator.dart';
part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit({required this.repository}) : super(AboutInitial());

  Repository repository;
  GetAboutUsResponse ?getAboutUsResponse;
  static AboutCubit get(context) => BlocProvider.of(context);



    getAbout() async {
      emit(AboutLoading());
      String token = sl<LocalDataSource>().getToken();
      if(token.isEmpty){
        emit(AboutEmpty());
        return ;
      }


      final contactOrFailure = await repository.getAboutUs();
      contactOrFailure.fold(
              (failure) => emit(AboutError(message: failure.message?? '')),
      (success) {
        getAboutUsResponse = success;
        emit(AboutSuccess(getAboutUsResponse: success));
      }); }}


