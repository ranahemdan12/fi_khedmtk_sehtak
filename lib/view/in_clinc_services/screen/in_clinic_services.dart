import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../../scan_screen/widget/scan_container.dart';
import '../../scan_screen/widget/works_list_tile.dart';



class InClinicServices extends StatelessWidget {
  const InClinicServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.inClinicsServices,
        actionWidget: IconButton(onPressed: (){

          Navigator.pushNamed(context, Routes.searchInClinicScreen);
        },icon: SvgPicture.asset(AssetManger.searchIcon),),

        body: Column(
          children: [
            SizedBox(height: 21.h,),
            CustomRowLocation(),
            SizedBox(height: 21.h,),
            ScanContainer(svgPic: AssetManger.discountIcon, text: StringManger.discountShamel,textT: StringManger.details,onTab: (){
              Navigator.pushNamed(context, Routes.shamelScreen);


            },),

            SizedBox(height: 21.h,),
            Container(
              height: 550.h,
              width: 338.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorManger.whiteGreyColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 6,top: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringManger.howItWorks,

                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManger.blackColor,
                      ),),
                    SizedBox(height: 15.h,),
                    WorksListTile(svgPic: AssetManger.oneIcon, text: StringManger.chooseArea, textT: 'You can select the nearest branch to  you',),

                    WorksListTile(svgPic: AssetManger.twoIcon, text: StringManger.addScans, textT: 'You can also book by prescription',),

                    WorksListTile(svgPic: AssetManger.threeIcon, text: StringManger.selectScans, textT: 'Compare availability, prices , location & schedule',),

                    WorksListTile(svgPic: AssetManger.fourIcon, text: StringManger.readService, textT: 'Follow the instructions before your scan visit',),

                    WorksListTile(svgPic: AssetManger.fiveIcon, text: StringManger.selectDate, textT: 'Schedule your visit to scan center',),




                  ],
                ),
              ),
            ),

          ],
        ));
  }
}
