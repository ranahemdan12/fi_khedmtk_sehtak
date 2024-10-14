import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/models/response/get_citiy/get_city_response.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/request/get_region/get_region_request.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../select_city_screen/cubit/city_cubit.dart';
import '../../../select_region_screen/cubit/region_cubit.dart';
import '../cubit/signup_cubit.dart';



class CityDropDown extends StatefulWidget {
  const CityDropDown({
    Key? key,
  }) : super(key: key);
  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  CityItem? citySelectedValue;
  CityCubit? governorateCubit;
  selectCity(CityItem selected) {
    // print(selected.cityNameAr);
    RegionCubit.get(context).selectedCity = selected;
    RegionCubit.get(context)
        .getRegion(request: GetRegionReqModel(governoratesItem: selected));
    setState(() {
      citySelectedValue = selected;
      SignupCubit.get(context).city = selected.id ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityCubit, CityState>(
        listener: (context, state) {
      if (state is CitySuccessState) {
        selectCity(state.model.cityItem.first);
      }
    }, builder: (BuildContext context, CityState state) {
      if (state is CitySuccessState) {
        return SizedBox(
          height: 50.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<CityItem>(
              isDense: false,
              isExpanded: true,
              hint: Text(
                StringManger.city.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ColorManger.mainColor,
                      fontSize: 14.sp,
                    ),
              ),
              items: state.model.cityItem
                  .map((item) => DropdownMenuItem<CityItem>(
                        value: item,
                        child: Text(
                          item.cityName ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: ColorManger.blackColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: citySelectedValue,
              onChanged: (CityItem? value) {
                selectCity(value ?? CityItem());
              },
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsetsDirectional.only(end: 14),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: ColorManger.blueColor,
                  ),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                // maxHeight: 272.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManger.whiteColor,
                ),

                scrollbarTheme: const ScrollbarThemeData(
                  radius: Radius.circular(8),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                // height: 272,
                padding: EdgeInsetsDirectional.only(
                  start: 14,
                ),
              ),
            ),
          ),
        );
      } else {
        return Container(
          height: 50.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManger.blueColor),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }
    });


  }
}
