import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../select_region_screen/cubit/region_cubit.dart';
import '../pharmacy_search_cubit/pharmacy_search_cubit.dart';



class PharmacyTextField extends StatefulWidget {
  const PharmacyTextField({super.key});

  @override
  State<PharmacyTextField> createState() => _PharmacyTextFieldState();
}



class _PharmacyTextFieldState extends State<PharmacyTextField> {

  final TextEditingController searchController = TextEditingController();
  late PharmacySearchCubit pharmacySearchCubit;
  void _searchPharmacy(
      {required PharmacySearchCubit cubit,
      int? city,
      int? region,
      required String text}) async {
    final searchText = text;

    cubit.searchControllerChannel.sink.add({
      'searchValue': searchText,
      'searchCity': city,
      'searchRegion': region,
    });
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    pharmacySearchCubit = PharmacySearchCubit.get(context)..initializeSearch();
    super.initState();
  }
 late FocusNode _focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 325.w,
      child: TextFormField(
        textInputAction: TextInputAction.done,
        focusNode: _focusNode,
        onEditingComplete: () {
        _focusNode.unfocus();
        },

        onChanged: (value) {

          // PharmacySearchCubit.get(context).filterPharmacy(filterVal: value);
          _searchPharmacy(
            cubit: pharmacySearchCubit,
            text: value,
            region: RegionCubit.get(context).selectedRegion?.id,
            city: RegionCubit.get(context).selectedCity?.id,
          );
        },
        keyboardType: TextInputType.text,
        controller: searchController,

        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.greyFieldColor, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.greyFieldColor, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: StringManger.search.tr(),
          hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14.sp,
                color: ColorManger.greyHintColor,
              ),
          prefixIcon: const Icon(
            Icons.search,
            color: ColorManger.greyPrefColor,
          ),
        ),
      ),
    );
  }
}
