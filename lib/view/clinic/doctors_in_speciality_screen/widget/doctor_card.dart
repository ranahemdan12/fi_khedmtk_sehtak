import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';



class DoctorInformation extends StatefulWidget {
   const DoctorInformation({super.key,required this.doctor});

 final ClinicsResultItem doctor;

  @override
  State<DoctorInformation> createState() => _DoctorInformationState();
}

class _DoctorInformationState extends State<DoctorInformation> {

  String sub = '';

  @override
  void initState() {
   for (String element in (widget.doctor.doctor?.subSpecialization ?? [''])) {
     sub = element==widget.doctor.doctor?.subSpecialization.last?'$sub$element':'$sub$element, ';
   //   $sub$element .
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsetsDirectional.only(bottom:15),
      child: Container(
        width: 358.w,
        decoration: BoxDecoration(
          color: ColorManger.whiteDColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManger.mainColor,),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 13,end: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              Row(  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCachedNetworkImage(imageUrl: widget.doctor.doctor?.user?.image??"", height:  60.h, width:60.w, borderRadius: 50,fit: BoxFit.cover,),
                  SizedBox(width: 8.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.h,),
                      Text(widget.doctor.doctor?.user?.firstName ??'',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:Theme.of(context).textTheme.bodySmall?.copyWith( color: ColorManger.blackColor,),),
                      SizedBox(height: 6.h,),
                      Text( widget.doctor.doctor!.specialization ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:13.sp),),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 16.h,),
              IntrinsicHeight(
                child: Row(
                  children: [
                  
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      
                            widget.doctor.doctor?.subSpecialization.isNotEmpty  == true ?Text(
                              sub,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManger.greyItemColor),):const SizedBox(),
                            SizedBox(height: 8.h,),
                            Text( widget.doctor.clinicName ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:13.sp),),
                          ],
                        ),
                    ),
                
                    SizedBox(width: 23.w,),
                    const VerticalDivider(
                      color:ColorManger.dividerColor2,
                      thickness: 1,
                    ),
                    SizedBox(width: 23.w,),
                    Expanded(
                      child: Column(
                        children: [
                          RichText(text: TextSpan(
                            text: StringManger.priceBeforeDiscount.tr(),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManger.blueColor,
                                fontSize: 12.sp),
                            children: [
                              TextSpan(text:  "${widget.doctor.examinationFees }",
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 11),),
                            ],
                                      
                          ),),
                          SizedBox(height: 8.h,),
                          RichText(text: TextSpan(
                            text: StringManger.priceAfterDiscount.tr(),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManger.blueColor,),
                            children: [
                              TextSpan(text:"${widget.doctor.sehtakFees }",
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorManger.redColor,
                                    fontSize: 11),),
                            ],
                                      
                          ),),
                                      
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),


            ],
          ),
        ),
      ),
    );
  }
}
