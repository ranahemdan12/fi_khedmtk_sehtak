import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/frame_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../shared/resources/color_manger.dart';


class InscExpansion extends StatefulWidget {
  const InscExpansion({Key? key}) : super(key: key);

  @override
  State<InscExpansion> createState() => _InscExpansionState();
}

class _InscExpansionState extends State<InscExpansion> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 26,end: 25,),
      child: Container(
        color: ColorManger.blueCColor,
        child: ExpansionTile(title: Text(StringManger.analysis),

          children: [
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsetsDirectional.symmetric(horizontal: 7,vertical: 9),
                  child: Wrap(
                      direction: Axis.horizontal,
                   runSpacing: 12.h,
                   spacing: 27.w,
                   children: [FrameContainer(text: 'Unicare'),
                   SizedBox(width: 15.w,),
                   FrameContainer(text: 'Wadi El Nlie'),
                   SizedBox(width: 15.w,),
                   FrameContainer(text: 'National Mirs Insurance')],
                  ),
                ),
                // ListTile(
                //   title: Text('ASOT ( Antistreptolysin 0 Latex )'),
                //   subtitle: Text('ASOT ( Antistreptolysin 0 Latex )'),
                //   titleTextStyle:  GoogleFonts.montserrat(
                //     fontSize: 14.sp,
                //     fontWeight: FontWeight.w600,
                //     color:ColorManger.blackColor ,
                //   ),
                //   subtitleTextStyle:  GoogleFonts.montserrat(
                //     fontSize: 12.sp,
                //     fontWeight: FontWeight.w600,
                //     color:ColorManger.labelGrayColor ,
                //   ),
                // ),

              ],
            )
          ],

        ),
      ),
    );
  }
}