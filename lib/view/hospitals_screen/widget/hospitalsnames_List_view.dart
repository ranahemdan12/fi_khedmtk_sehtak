import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class HospitalsNamesListView extends StatelessWidget {
  const HospitalsNamesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: ( context,  index) => GestureDetector(
        onTap: (){
           Navigator.pushNamed(context, Routes.hospitalsScreen);
        },
        child: Padding(
          padding:  EdgeInsetsDirectional.only(top: 17,start: 26,end: 26),
          child: Container(
            width: 338.w,
            height: 50.h,
            decoration: BoxDecoration(color: ColorManger.whiteGColor,
              borderRadius: BorderRadius.circular(8),),

            child:  Padding(
              padding:EdgeInsetsDirectional.only(start: 8,top:8 ,),
              child: Text('Safwa Golf Hospital',
                maxLines: 2,
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color:ColorManger.blueColor ,
                ),
              ),
            ),

          ),
        ),
      ),
      itemCount: 20,);
  }
}
