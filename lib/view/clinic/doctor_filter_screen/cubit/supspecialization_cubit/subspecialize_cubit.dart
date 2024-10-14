
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/response/clinic/get_sub_specialization/get_sub_specialization.dart';

import '../../../../../repository/repository.dart';

part 'subspecialize_state.dart';

class SubSpecializeCubit extends Cubit<SubSpecializeState> {
  SubSpecializeCubit({required this.repository}) : super(SubSpecializeInitial());
  Repository repository;

  List<SubSpecializationItem>? resultModel;


  static SubSpecializeCubit get(context)=> BlocProvider.of(context);


  getSubSpecialization(int id) async{
    emit(SubSpecializeLoadingState());


    final getSubSpecialization = await repository.subCategories(id: id);
    getSubSpecialization.fold(
            (failure) => emit(SubSpecializeErrorState(message: failure.message)),
            (success) {
              resultModel = success.subCategories;
              resultModel?.isEmpty == true
              ? emit(SubSpecializeEmptyState())
              : emit(SubSpecializeSuccessState(model: success));
        });
}



   resetSubSpecialization(){
    emit(SubSpecializeSuccessState(model:GetSubSpecializationModel(subCategories: resultModel ?? []) ));
   }

  filterSubSpecialization({required String filterVal}) {
    final stata = state;
    if (stata is SubSpecializeSuccessState) {
      List<SubSpecializationItem> filtered = [];
      resultModel?.forEach((element) {
        element.name.toString().contains(filterVal) == true
            ? {filtered.add(element),}:{};
      });
      filtered.isEmpty
          ? emit(SubSpecializeEmptyState())
          : emit(SubSpecializeSuccessState(
          model: GetSubSpecializationModel(subCategories: filtered)));
    }
  }
}

