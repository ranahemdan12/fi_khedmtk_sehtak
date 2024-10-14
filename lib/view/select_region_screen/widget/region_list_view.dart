import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/service_locator.dart';
import '../cubit/region_cubit.dart';



class RegionListView extends StatelessWidget {
  const RegionListView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionCubit, RegionState>(builder: (context, state) {
      if (state is RegionLoading) {
        return const CustomShimmer();
      }
      else if (state is RegionSuccessState) {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              RegionCubit.get(context).selectedRegion=state.model.regionItem[index]; // HospitalsCubit.get(context).getHospitalsBranches(city:HospitalFilterCubit.get(context).city ,region:HospitalFilterCubit.get(context).region ,);
              sl<NavigationService>()
                  .pop();
              // RegionCubit.get(context).selectedTab == SelectedTab.hospitals
              //     ?  sl<NavigationService>()
              //     .pop()
              //     : {
              //         sl<NavigationService>()
              //             .pop()
              //       };

            },
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 17, start: 26, end: 26),
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
                     "${state.model.regionItem[index].regionName} " ,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ColorManger.blueColor),
                  ),
                ),
              ),
            ),
          ),
          itemCount: state.model.regionItem.length,
        );
      }
      else if (state is RegionErrorState) {
        return Center(child: Text('${state.message}'));
      }
      else {
        return Center(child: Image.asset("assets/images/noData.png"));
      }
    });
  }
}
