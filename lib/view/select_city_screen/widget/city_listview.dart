import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/request/get_region/get_region_request.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../select_region_screen/cubit/region_cubit.dart';
import '../cubit/city_cubit.dart';

class CityListView extends StatelessWidget {
  const CityListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
        builder: (context, state) {
      if (state is CityLoading) {
        return const CustomShimmer();
      }
      else if (state is CitySuccessState) {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              sl<NavigationService>().navigateReplacementTo(Routes.selectCityScreen);
              RegionCubit.get(context).selectedCity=state.model.cityItem[index];
              RegionCubit.get(context).getRegion(
                  request: GetRegionReqModel(
                      governoratesItem:
                          state.model.cityItem[index]));
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 17, start: 26, end: 26),
              child: Container(
                width: 338.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: ColorManger.whiteGColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 8,
                    top: 8,
                  ),
                  child: Text(
                   "${state.model.cityItem[index].cityName}  ",
                    maxLines: 2,
                    style:Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManger.blueColor),

                  ),
                ),
              ),
            ),
          ),
          itemCount: state.model.cityItem.length,
        );
      }
      else if (state is CityErrorState) {
        return Center(child: Text('${state.message}'));
      } else {
      return Center(child: Image.asset("assets/images/noData.png"));
      }
    });
  }
}
