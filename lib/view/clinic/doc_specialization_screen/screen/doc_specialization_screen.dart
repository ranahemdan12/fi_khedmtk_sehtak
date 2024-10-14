import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/navigation_service.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
import '../widget/service_grid_item.dart';
import '../cubit/categories_cubit.dart';

class DoctorSpecializationScreen extends StatefulWidget {
  const DoctorSpecializationScreen({Key? key}) : super(key: key);

  @override
  State<DoctorSpecializationScreen> createState() =>
      _DoctorSpecializationScreenState();
}

class _DoctorSpecializationScreenState
    extends State<DoctorSpecializationScreen> {

  @override
  void initState() {
    super.initState();
    CategoriesCubit.get(context).getCategory();
  }

  @override
  Widget build(BuildContext context) {

    return CustomScreen(
      text: StringManger.doctor.tr(),

      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return const CustomLoadingIndicator();
          }
          else if (state is CategoriesSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 26,vertical: 35),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.22,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 16, //vertical
                      ),
                      itemBuilder: (context, index) => ServiceGridItem(
                        isNetworkImage: true,
                        serviceIcon  : state
                            .categories[index].icon ??
                            '',
                        serviceText: state
                            .categories[index].name ??
                            '',
                        onTap:(){
                          DoctorsInSpecialityCubit.get(context).setSelected(speciality:
                          state.categories[index]);
                          sl<NavigationService>().navigateTo(Routes.doctorsScreen);

                        },
                      ),
                      itemCount: state.categories.length,
                    ),
                  ),
                ),
              ],
            );
          }else if (state is CategoriesErrorState){
            return Center(child: Text('${state.message}'));
          }
          {
            return Center(child: Image.asset("assets/images/noData.png"));
          }
        },
      ),
    );
  }

}
