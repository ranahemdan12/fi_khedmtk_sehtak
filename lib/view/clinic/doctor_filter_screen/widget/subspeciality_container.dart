
import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';

class SubSpecialityContainer extends StatefulWidget {
  const SubSpecialityContainer({super.key});

  @override
  State<SubSpecialityContainer> createState() => _SubSpecialityContainerState();
}

class _SubSpecialityContainerState extends State<SubSpecialityContainer> {

  String sub = '';


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        sl<NavigationService>().navigateTo(Routes.subSpecialityScreen);
        DoctorsInSpecialityCubit.get(context).selectedSpeciality.id;


      },
      child: Padding(
        padding:  const EdgeInsetsDirectional.only(start: 16,end: 28),
        child: Container(
          height: 65.h,
          width: 346.w,
          decoration: BoxDecoration(
            color: ColorManger.whiteGColor,
            border: Border.all(
              color: ColorManger.whiteGreyColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          child:ListTile(
            horizontalTitleGap: 2,
            contentPadding:const  EdgeInsetsDirectional.only(start: 13,end: 0),

            title: Text(
              StringManger.subSpeciality.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ColorManger.greyFColor,
                fontSize: 14.sp,
              ),


            ),

            trailing: Wrap(

                children: [IconButton(
                  onPressed: (){},
                  icon:const  Icon(Icons.arrow_forward_ios_sharp,
                  size: 20,
                  color: ColorManger.whiteGreyColor,
                ),
                ),]
            ),

          )
          ,
        ),
      ),
    );
  }
}
