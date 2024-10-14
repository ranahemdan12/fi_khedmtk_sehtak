import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../cubit/doctor_filter_cubit/doctor_filter_cubit.dart';

class GenderRadioTile extends StatefulWidget {
  const GenderRadioTile({super.key});

  @override
  State<GenderRadioTile> createState() => _GenderRadioTileState();
}

class _GenderRadioTileState extends State<GenderRadioTile> {
  String? lang;

  @override
  Widget build(BuildContext context) {
    lang = DoctorFilterCubit.get(context).gender;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 35, end: 35),
      child: BlocListener<DoctorFilterCubit, DoctorFilterState>(
        listener: (context, state) {
          if (state is FilterResetState) {
            setState(() {
              lang = '';
            });
          }
        },
        child: Row(children: [
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
                    value: StringManger.male.tr(),
                    groupValue: lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                      DoctorFilterCubit.get(context).setGender(lang ?? '');
                    }),
                Text(
                  StringManger.male.tr(),
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
                    value: StringManger.female.tr(),
                    groupValue: lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                      DoctorFilterCubit.get(context).setGender(lang ?? '');
                    }),
                Text(
                  StringManger.female.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
