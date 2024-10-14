import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/service_locator.dart';
import '../../doctor_filter_screen/cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../cubit/doctors_in_speciality_cubit.dart';

class RadioTileWidget extends StatefulWidget {
  const RadioTileWidget({super.key});

  @override
  State<RadioTileWidget> createState() => _RadioTileWidgetState();
}

class _RadioTileWidgetState extends State<RadioTileWidget> {
  String? lang;
  @override
  Widget build(BuildContext context) {
    lang = DoctorFilterCubit
        .get(context)
        .orderBy;
    return BlocListener<DoctorFilterCubit,DoctorFilterState>(
      listener: (BuildContext context, DoctorFilterState state) {
        if(state is FilterResetState){

          setState(() {
            lang = '';
          });
        }
      },
      child: Column(
        children: [
          RadioListTile(
            selectedTileColor: ColorManger.blueColor ,
            activeColor: ColorManger.blueColor,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            dense: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringManger.priceHighToLow.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            value:StringManger. mostRecommended.tr(),
            groupValue: lang,
            onChanged: (value) {
              setState(() {
                lang = value.toString();

              });

              DoctorFilterCubit.get(context).setOrderBy(lang ?? '');
              DoctorsInSpecialityCubit.get(context).getClinicsInSpeciality();


            },
          ),
          RadioListTile(
            selectedTileColor: ColorManger.blueColor ,
            activeColor: ColorManger.blueColor,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),//<-- add this
            dense: true,//<-- add this
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringManger.priceLowToHigh.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),

              ],
            ),
            value: StringManger.priceLowToHigh.tr(),
            groupValue: lang,
            onChanged: (value) {
              setState(() {
                lang = value.toString();
              });
              DoctorFilterCubit.get(context).setOrderBy(lang ?? '');
              DoctorsInSpecialityCubit.get(context).getClinicsInSpeciality(orderBy: lang);
              sl<NavigationService>().pop();
            },
          ),
          // RadioListTile(
          //   selectedTileColor: ColorManger.blueColor ,
          //   activeColor: ColorManger.blueColor,
          //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),//<-- add this
          //   dense: true,//<-- add this
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         StringManger.priceHighToLow.tr(),
          //         style: Theme.of(context).textTheme.titleSmall,
          //       ),
          //
          //     ],
          //   ),
          //   value: StringManger.priceHighToLow.tr(),
          //   groupValue: lang,
          //   onChanged: (value) {
          //     setState(() {
          //       lang = value.toString();
          //     });
          //   },
          // ),
          // RadioListTile(
          //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          //   dense: true,
          //   selectedTileColor: ColorManger.blueColor ,
          //   activeColor: ColorManger.blueColor,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         StringManger.shortWaitingTimes.tr(),
          //         style: Theme.of(context).textTheme.titleSmall,
          //       ),
          //
          //     ],
          //   ),
          //   value:  StringManger.shortWaitingTimes.tr(),
          //   groupValue: lang,
          //   onChanged: (value) {
          //     setState(() {
          //       lang = value.toString();
          //     });
          //   },
          // ),

        ],
      ),
    );
  }
}
