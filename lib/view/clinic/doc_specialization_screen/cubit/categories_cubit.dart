import 'package:fi_khedmtk_sehtak/data/local/local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/response/clinic/get_specialization/get_specialization.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/service_locator.dart';
part 'categories_state.dart';


class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.repository,}) : super(CategoriesInitial());



  Repository repository;
  List<SpecializationResponseModel> categories =[];
  static CategoriesCubit get(context)=> BlocProvider.of(context);

  getCategory() async{
    emit(CategoriesLoadingState());
    String token = sl<LocalDataSource>().getToken();
    if(token.isEmpty){
      emit(CategoriesEmptyState());
      return ;
    }
    final categoryOrFailure = await repository.categories();
    categoryOrFailure.fold(
            (failure) => emit(CategoriesErrorState(message: failure.message)),
            (success) {
              List<SpecializationResponseModel> category =[];
              category =success.categories;
              categories =  category.where((element) => element.isDentist!=true,).toList();
              emit(CategoriesSuccessState(categories: categories));
            }
    );
  }
}
