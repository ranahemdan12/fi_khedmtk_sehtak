
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';


class AvailabilityRadioTile extends StatefulWidget {
  const AvailabilityRadioTile({super.key});

  @override
  State<AvailabilityRadioTile> createState() => _AvailabilityRadioTileState();
}

class _AvailabilityRadioTileState extends State<AvailabilityRadioTile> {
  String?lang ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 35,end: 35),
      child: Row(
        children: [
          Container(
            width: 97.w,
            height: 37.h,
            decoration: BoxDecoration(
              color:ColorManger.whiteTColor,
              border: Border.all(color:ColorManger.whiteGreyColor ),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(

              children: [
                Radio(activeColor: ColorManger.blueColor,

                    value:  StringManger.anyDay.tr(), groupValue:lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                    } ),

                Text(
                  StringManger.anyDay.tr(),
                  style:Theme.of(context).textTheme.titleSmall,
                ),

              ],
            ),
          ),

          SizedBox(width: 10.w,),
          Container(
            width: 97.w,
            height: 37.h,
            decoration: BoxDecoration(
              color:ColorManger.whiteTColor,
              border: Border.all(color:ColorManger.whiteGreyColor ),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(

              children: [
                Radio(activeColor: ColorManger.blueColor,

                    value:  StringManger.today.tr(), groupValue:lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                    } ),

                Text(
                  StringManger.today.tr(),
                  style:Theme.of(context).textTheme.titleSmall,
                ),

              ],
            ),
          ),

          SizedBox(width: 10.w,),
          Container(
            width: 97.w,
            height: 37.h,
            decoration: BoxDecoration(
              color:ColorManger.whiteTColor,
              border: Border.all(color:ColorManger.whiteGreyColor ),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(

              children: [
                Radio(activeColor: ColorManger.blueColor,

                    value:  StringManger.tomorrow.tr(), groupValue:lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                    } ),

                Text(
                  StringManger.tomorrow.tr(),
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
