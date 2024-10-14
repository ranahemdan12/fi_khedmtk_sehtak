import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/enum.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../clinic/doc_specialization_screen/cubit/categories_cubit.dart';
import '../../clinic/doc_specialization_screen/widget/service_grid_item.dart';
import '../cubit/hospital_service_details/hospital_service_details_cubit.dart';


class HospitalsClinicSpecialization extends StatefulWidget {
  const HospitalsClinicSpecialization({super.key});

  @override
  State<HospitalsClinicSpecialization> createState() => _HospitalsClinicSpecializationState();
}

class _HospitalsClinicSpecializationState extends State<HospitalsClinicSpecialization> {
  @override
  void initState() {
    super.initState();
    CategoriesCubit.get(context).getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.clinicSpecializations.tr(),
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
                      serviceIcon  : state.categories[index].icon ??
                          '',
                      serviceText: state.categories[index].name ??
                          '',
                      onTap:(){
                        HospitalServiceDetailsCubit.get(context).hospitalServiceEnum=HospitalServiceEnum.clinics;
                        HospitalServiceDetailsCubit.get(context).clinicServiceId=state
                            .categories[index].id;
                        sl<NavigationService>().navigateTo(Routes.hospitalServicesDetails,);
                      },
                    ),
                    itemCount: state
                        .categories.length,
                  ),
                ),
              ),
            ],
          );
        }
        else if(state is CategoriesErrorState){
          return Center(child: Text(state.message??''));
        }
        {
          return Center(child: Image.asset("assets/images/noData.png"));
        }
      },
    ),



    );
  }
}
