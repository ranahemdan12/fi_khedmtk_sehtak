import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../cubit/hospital_service_filter/hospital_service_filter_cubit.dart';


class DoctorTitleRadioTile extends StatefulWidget {
  const DoctorTitleRadioTile({super.key});

  @override
  State<DoctorTitleRadioTile> createState() => _DoctorTitleRadioTileState();
}

class _DoctorTitleRadioTileState extends State<DoctorTitleRadioTile> {
  String?lang ;
  @override
  Widget build(BuildContext context) {
    lang = HospitalServiceFilterCubit.get(context).title;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 29,),
      child: BlocListener<HospitalServiceFilterCubit,HospitalServiceFilterState>(
        listener: (BuildContext context, HospitalServiceFilterState state) {
          if(state is FilterResetState){
            setState(() {
              lang ='';
            });
          }
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 130.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color:ColorManger.whiteTColor,
                    border: Border.all(color:ColorManger.whiteGreyColor ),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(

                    children: [
                      Radio(
                          activeColor: ColorManger.blueColor,
                          value:   StringManger.professor.tr(),
                          groupValue:lang,
                          onChanged: (value) {
                            setState(() {
                              lang = value.toString();
                            });
                            HospitalServiceFilterCubit.get(context).setTitle(lang??'');
                          } ),

                      Text(
                        StringManger.professor.tr(),
                        style:Theme.of(context).textTheme.titleSmall,
                      ),

                    ],
                  ),
                ),

                SizedBox(width: 46.w,),
                Container(
                  width: 130.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color:ColorManger.whiteTColor,
                    border: Border.all(color:ColorManger.whiteGreyColor ),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(

                    children: [
                      Radio(
                          activeColor: ColorManger.blueColor,
                          value:  StringManger.lecturer.tr(),
                          groupValue:lang,
                          onChanged: (value) {
                            setState(() {
                              lang = value.toString();
                            });
                            HospitalServiceFilterCubit.get(context).setTitle(lang??'');
                          } ),

                      Text(
                        StringManger.lecturer.tr(),
                        style:Theme.of(context).textTheme.titleSmall,
                      ),

                    ],
                  ),
                ),


              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Container(
                  width: 130.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color:ColorManger.whiteTColor,
                    border: Border.all(color:ColorManger.whiteGreyColor ),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(

                    children: [
                      Radio(activeColor: ColorManger.blueColor,

                          value:   StringManger.consultant.tr(), groupValue:lang,
                          onChanged: (value) {
                            setState(() {
                              lang = value.toString();
                            });
                            HospitalServiceFilterCubit.get(context).setTitle(lang??'');
                          } ),

                      Text(
                        StringManger.consultant.tr(),
                        style:Theme.of(context).textTheme.titleSmall,
                      ),

                    ],
                  ),
                ),

                SizedBox(width: 46.w,),
                Container(
                  width: 130.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color:ColorManger.whiteTColor,
                    border: Border.all(color:ColorManger.whiteGreyColor ),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(

                    children: [
                      Radio(activeColor: ColorManger.blueColor,

                          value:  StringManger.specialist.tr(), groupValue:lang,
                          onChanged: (value) {
                            setState(() {
                              lang = value.toString();
                            });
                            HospitalServiceFilterCubit.get(context).setTitle(lang??'');
                          } ),

                      Text(
                        StringManger.specialist.tr(),
                        style:Theme.of(context).textTheme.titleSmall,
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}