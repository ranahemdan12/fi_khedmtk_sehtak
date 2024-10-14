
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';


class EntityRadioTile extends StatefulWidget {
  const EntityRadioTile({super.key});

  @override
  State<EntityRadioTile> createState() => _EntityRadioTileState();
}

class _EntityRadioTileState extends State<EntityRadioTile> {
  String? lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsetsDirectional.only(start: 35, end: 35),
          child: Row(
            children: [
              Container(
                width: 97.w,
                height: 37.h,
                decoration: BoxDecoration(
                  color: ColorManger.whiteTColor,
                  border: Border.all(color: ColorManger.whiteGreyColor),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Row(
                  children: [
                    Radio(
                        activeColor: ColorManger.blueColor,
                        value: StringManger.clinic.tr(),
                        groupValue: lang,
                        onChanged: (value) {
                          setState(() {
                            lang = value.toString();
                          });
                        }),
                    Text(
                      StringManger.clinic.tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              Container(
                width: 108.w,
                height: 37.h,
                decoration: BoxDecoration(
                  color: ColorManger.whiteTColor,
                  border: Border.all(color: ColorManger.whiteGreyColor),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Row(
                  children: [
                    Radio(
                        activeColor: ColorManger.blueColor,
                        value: StringManger.hospital.tr(),
                        groupValue: lang,
                        onChanged: (value) {
                          setState(() {
                            lang = value.toString();
                          });
                        }),
                    Text(
                      StringManger.hospital.tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

  }
}
