import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/models/response/get_region/get_region_response.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/view/auth/signup_screen/cubit/signup_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/select_region_screen/cubit/region_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/color_manger.dart';



class DropDownRegion extends StatefulWidget {
  const DropDownRegion({Key? key}) : super(key: key);

  @override
  State<DropDownRegion> createState() => _DropDownRegionState();
}

class _DropDownRegionState extends State<DropDownRegion> {
  RegionItem? dropdownValue;
  selectRegion(RegionItem selected) {
    setState(() {
      dropdownValue = selected;
      SignupCubit.get(context).region = selected.id ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionCubit, RegionState>(
      listener: (context, state) {
        if (state is RegionSuccessState) {
          selectRegion(state.model.regionItem.first);
        }
      },
      builder: (BuildContext context, RegionState state) {
        if (state is RegionSuccessState) {
          return SizedBox(
            height: 50.h,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<RegionItem>(
                isExpanded: true,
                hint: Text(
                  StringManger.region.tr(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: ColorManger.mainColor,
                        fontSize: 14.sp,
                      ),
                ),
                items: state.model.regionItem
                    .map((item) => DropdownMenuItem<RegionItem>(
                          value: item,
                          child: Text(
                            item.regionName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: ColorManger.blackColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: dropdownValue,
                onChanged: (RegionItem? value) {
                  selectRegion(value ?? RegionItem());
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
                  maxHeight: 272.h,
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
      },
    );

    //   Container(
    //   height: 60.h,
    //   decoration:  BoxDecoration(
    //     borderRadius: BorderRadius.circular(4),
    //       border:Border.all(
    //         color: ColorManger.blueColor,
    //       ),),
    //   child: DropdownButtonHideUnderline(
    //
    //     child: DropdownButton2(
    //
    //       isExpanded: true,
    //       hint:  Text(StringManger.city.tr(),
    //         style: Theme.of(context).textTheme.labelLarge?.copyWith(
    //           color: ColorManger.mainColor,
    //           fontSize: 14.sp,
    //         ),),
    //       value: dropdownValue,
    //       onChanged: ( item){
    //         setState(() {
    //           dropdownValue =  item as String?;
    //         });
    //       },
    //       items:  governorateCubit?.governoratesResponseModel?.map((  item) {
    //         return DropdownMenuItem(
    //         value:  item,
    //          child: Text(
    //            item.cityNameAr?? '',
    //            style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blackColor),
    //          ),
    //          );
    //        }).toList(),
    //
    //
    //  ),
    //   ),
    // );
  }
}
