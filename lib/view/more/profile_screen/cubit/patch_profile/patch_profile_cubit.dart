import 'package:bloc/bloc.dart';
import 'package:fi_khedmtk_sehtak/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../models/request/auth/patch_profile/patch_profile_request.dart';
import '../../../../../models/response/auth/patch_profile/patch_profile.dart';
part 'patch_profile_state.dart';

class PatchProfileCubit extends Cubit<PatchProfileState> {

  PatchProfileCubit({required this.repository}) : super(PatchProfileInitial());

  final Repository repository;
  PatchProfileResponse? patchProfileResponse;
  PatchProfileRequest?profileRequest;
  static PatchProfileCubit get(context)=> BlocProvider.of(context);

  patchProfile({required PatchProfileRequest request})async{
   emit(PatchProfileLoading());
   final patchProfile = await  repository.patchProfile(request: request);
   patchProfile.fold((l){
     emit(PatchProfileError(message:l.message??'' ));
   },
      (r)async{

     emit(PatchProfileSuccess(message: r.message??"",name: request.user?.firstName??''));

      }

   ) ;

  }
}
