import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/enum.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/view/clinic/doctors_in_speciality_screen/widget/radio_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../doctor_filter_screen/cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../cubit/doctors_in_speciality_cubit.dart';
import 'doctors_in_speciality_button.dart';

class DoctorInfoRow extends StatelessWidget {
  const DoctorInfoRow({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisSize: MainAxisSize.min,
      children: [
        CustomDermatologyButton(
          onPressed: () {showSheet(context);},
          text: StringManger.sort.tr(), svgPic: AssetManger.sortIcon,),
        SizedBox(width:6.w),
        CustomDermatologyButton(
          onPressed: () {sl<NavigationService>().navigateTo(Routes.doctorFilterScreen);},
          text: StringManger.filter.tr(), svgPic: AssetManger.filterIcon,),
        // SizedBox(width:6.w),
        // CustomDermatologyButton(
        //   onPressed: () {sl<NavigationService>().navigateTo(Routes.map,arguments: MapTypeEnum.doctors);},
        //   text: StringManger.map.tr(), svgPic: AssetManger.mapIcon,),
      ],
    );


  }
}
void showSheet(context) {
  showModalBottomSheet(
      backgroundColor: ColorManger.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 240.h,
          width: 390.w,
          child: Padding(
            padding:const EdgeInsetsDirectional.only(start: 16,top: 14,end: 16),
            child: Column(
              children: [

             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                  StringManger.sortBy.tr(),
                     style: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManger.blueColor),)
                 ,
                 TextButton(onPressed: (){
                   DoctorFilterCubit.get(context).resetOrderBy();
                 }, child:  Text(StringManger.reset.tr(),
                   style: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManger.blueColor)

                   ,),),



             ],),
                SizedBox(
                  height: 3.h,
                ),
                const RadioTileWidget(),
                SizedBox(
                  height: 3.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(346, 37),
                      backgroundColor: ColorManger.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {
                    DoctorsInSpecialityCubit.get(context)
                        .getClinicsInSpeciality(orderBy: DoctorFilterCubit.get(context).orderBy,
                        reset: true);
                    sl<NavigationService>().pop();
                  },
                  child: Text(
                    StringManger.done.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),


              ],
            ),
          ),

        );
      });
}