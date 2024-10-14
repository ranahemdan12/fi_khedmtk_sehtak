import 'package:fi_khedmtk_sehtak/data/local/local_data_source.dart';
import 'package:fi_khedmtk_sehtak/models/request/auth/get_profile/get_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../shared/statics/service_locator.dart';
import '../../../../../models/response/auth/get_profile/get_profile.dart';
part 'profile_state.dart';



class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.repository}) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  Repository repository;
  ProfileSuccessResponseModel? profile;

  getProfile({String? address, GetProfileUser? user}) async {
    emit(ProfileLoading());

    String token = sl<LocalDataSource>().getToken();
    if (token.isEmpty) {
      emit(NoTokenState());
      return;
    }
    final profileOrFailure = await repository.profile();
    profileOrFailure
        .fold((failure) => emit(ProfileErrorState(message: failure.message)),
            (success) {
      profile = success;
      emit(ProfileSuccessState(profile: success));
    });
  }
  updateName(String name){
    if(profile != null){
      profile?.info?.firstName=name;
      emit(ProfileSuccessState(profile: profile!));
    }

  }
}
