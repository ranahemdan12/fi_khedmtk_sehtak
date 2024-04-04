import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/frame_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



import '../../../shared/resources/color_manger.dart';


class AboutExpansion extends StatefulWidget {
  const AboutExpansion({Key? key}) : super(key: key);

  @override
  State<AboutExpansion> createState() => _AboutExpansionState();
}

class _AboutExpansionState extends State<AboutExpansion> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 26,end: 25,),
      child: Container(
        color: ColorManger.blueCColor,
        child: ExpansionTile(title: Text(StringManger.aboutDoctor),

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsetsDirectional.symmetric(horizontal: 7,vertical: 9),
                  child:Text(
                    'Dermatologist & Aesthetic medicinespecialist.Master degree of dermatologylasers & aestheticmedicine Kasr alaini',
                  maxLines: 5,
                  style:  GoogleFonts.montserrat(
                           fontSize: 16.sp,
                           fontWeight: FontWeight.w500,
                           color:ColorManger.labelGrayColor ,   ),
                  ),
                ),

              ],
            )
          ],

        ),
      ),
    );
  }
}