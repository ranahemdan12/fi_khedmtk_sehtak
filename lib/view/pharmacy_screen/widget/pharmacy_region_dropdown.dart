import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/get_region/get_region_response.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../pharmacy_search_cubit/pharmacy_search_cubit.dart';
import '../../select_region_screen/cubit/region_cubit.dart';

class PharmacyRegionDropdown extends StatefulWidget {
  const PharmacyRegionDropdown({super.key});

  @override
  State<PharmacyRegionDropdown> createState() => _PharmacyRegionDropdownState();
}

class _PharmacyRegionDropdownState extends State<PharmacyRegionDropdown> {
  RegionItem? dropdownValue;

  selectRegion(RegionItem selected) {
    setState(() {
      dropdownValue = selected;
      RegionCubit.get(context).selectedRegion = selected;
      PharmacySearchCubit.get(context).getAllPharmacy(city: RegionCubit.get(context).selectedCity?.id,region: RegionCubit.get(context).selectedRegion?.id);
      // SignupCubit.get(context).region = selected.id ?? 0;
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
            width: 167.w,
            height: 35.h,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<RegionItem>(
                isExpanded: true,
                hint: Text(
                  StringManger.selectRegion.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: ColorManger.greyFColor),
                ),
                items: state.model.regionItem
                    .map((item) =>
                    DropdownMenuItem<RegionItem>(
                      value: item,
                      child: Text(
                        item.regionName ?? '',
                        maxLines: 1,

                        style: Theme
                            .of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: ColorManger.greyDropCityColor),
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
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: ColorManger.whiteGreyColor,
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


          );
        }
      },
    );
  }
}