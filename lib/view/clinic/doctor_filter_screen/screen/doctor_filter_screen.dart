import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
import '../cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../widget/custom_filter_text_divider.dart';
import '../widget/fees_slider.dart';
import '../widget/gender_radio_tile.dart';
import '../widget/subspeciality_container.dart';
import '../widget/title_radio_tile.dart';

//ignore: must_be_immutable
class DoctorFilterScreen extends StatefulWidget {
  DoctorFilterScreen({super.key, this.id});

  int? id;

  @override
  State<DoctorFilterScreen> createState() => _DoctorFilterScreenState();
}

class _DoctorFilterScreenState extends State<DoctorFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.filter.tr(),
        actionWidget: Padding(
          padding: const EdgeInsetsDirectional.only(end: 24),
          child: GestureDetector(
            onTap: () {
             double min = DoctorsInSpecialityCubit.get(context)
                  .getClinicsBySpecialityResponse
                  .minSehtakFees ??
                  0;
            double  max = DoctorsInSpecialityCubit.get(context)
                  .getClinicsBySpecialityResponse
                  .maxSehtakFees ?? 0.0;
              DoctorFilterCubit.get(context).resetFilter(minFees: min,maxFees: max);
            },
            child: Text(
              StringManger.reset.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorManger.whiteColor,
                    fontSize: 15.sp,
                  ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
              ),
               const SubSpecialityContainer(),
              SizedBox(
                height: 24.h,
              ),
              CustomFilterTextDivider(
                text: StringManger.gender.tr(),
              ),
              SizedBox(
                height: 16.h,
              ),
              const GenderRadioTile(),
              SizedBox(
                height: 24.h,
              ),
              CustomFilterTextDivider(
                text: StringManger.title.tr(),
              ),
              SizedBox(
                height: 16.h,
              ),
              const TitleRadioTile(),
              SizedBox(
                height: 24.h,
              ),
              CustomFilterTextDivider(
                text: StringManger.fees.tr(),
              ),
              SizedBox(
                height: 16.h,
              ),
              const FeesSlider(),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
                child: CustomButton(
                    text: StringManger.filter.tr(),
                    onPressed: _filterButton
                ),
              ),
                 SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ));
  }

  void _filterButton(){

    if( DoctorFilterCubit.get(context).validate()){
      DoctorsInSpecialityCubit.get(context)
          .getClinicsInSpeciality(
          gender: DoctorFilterCubit.get(context).gender,
          title: DoctorFilterCubit.get(context).title,
          maxFees: DoctorFilterCubit.get(context).maxFees  ,
          minFees: DoctorFilterCubit.get(context).minFees,
          subSpecialization: DoctorFilterCubit.get(context)
              .selectedSubSpecializations,
          reset: true);
      sl<NavigationService>().pop();
    }else{
      showToast(StringManger.noValueSelected.tr());
    }


  }
}
