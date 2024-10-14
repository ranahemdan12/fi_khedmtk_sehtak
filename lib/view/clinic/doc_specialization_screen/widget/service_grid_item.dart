import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/statics/enum.dart';



//ignore: must_be_immutable
class ServiceGridItem extends StatelessWidget {
   ServiceGridItem({Key? key,this.serviceIcon ,required this.serviceText, required this.onTap,this.isNetworkImage ,this.hospitalServiceEnum}) : super(key: key);

  final String? serviceIcon;
   final String? serviceText;

   Function()? onTap;
   bool? isNetworkImage=false;
   HospitalServiceEnum? hospitalServiceEnum ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 142.h,
        width:159.w ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManger.blueColor,
            width: 2.w,
          ),
        ),
        child: Padding(
          padding:  const EdgeInsetsDirectional.only(top: 13),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 7,),
                isNetworkImage==true?

                    CustomCachedNetworkImage(imageUrl: serviceIcon??'', height:  80.h, width: 80.w, borderRadius: 70, fit: BoxFit.cover,)
                    :SvgPicture.asset(
                  serviceIcon??'',
                  width: 80.w,
                  height: 80.h,
                fit: BoxFit.cover,),
                SizedBox(height: 10.h,),
                Text(serviceText??'',
                  overflow: TextOverflow.ellipsis,
                  maxLines:1,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: ColorManger.blueColor,
                  ),
                ),
                SizedBox(height: 7.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
