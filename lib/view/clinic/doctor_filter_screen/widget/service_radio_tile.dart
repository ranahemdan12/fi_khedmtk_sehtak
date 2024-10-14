
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';


class ServiceRadioTile extends StatefulWidget {
  const ServiceRadioTile({super.key});

  @override
  State<ServiceRadioTile> createState() => _ServiceRadioTileState();
}

class _ServiceRadioTileState extends State<ServiceRadioTile> {
  String?lang ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 29,end: 35),
      child: Row(
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

                    value:  StringManger.female.tr(), groupValue:lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                    } ),

                Text(
                  StringManger.clinicVisit.tr(),

                  style:Theme.of(context).textTheme.titleSmall,

                ),

              ],
            ),
          ),

          SizedBox(width: 13.w,),
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
                    value:  StringManger.homeVisit.tr(), groupValue:lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                    } ),

                Text(
                  StringManger.homeVisit.tr(),
                  style:Theme.of(context).textTheme.titleSmall,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
