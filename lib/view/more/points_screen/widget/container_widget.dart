import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/more/profile_screen/cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';


class PointsContainer extends StatelessWidget {
  const PointsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(
      builder: (BuildContext context, state) {
        if(state is ProfileSuccessState){
          return  Container(
            height: 146.h,
            width: 338.w,
            decoration: BoxDecoration(
              color: ColorManger.blueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:const EdgeInsetsDirectional.only(start: 30,end: 19,bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 24.h,),

                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(StringManger.totalPoints.tr(),
                                  style:  Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManger.whiteColor),),
                                SizedBox(width: 6.w,),
                                // SvgPicture.asset(AssetManger.whiteStarIcon),
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            // Text(state.profile.points??"",
                            //   style:  Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManger.whiteColor),),

                          ],
                        ),
                        SizedBox(width: 19.w,),
                        const VerticalDivider(
                          color: ColorManger.whiteColor,
                          thickness: 2,
                          indent: 5,
                          endIndent: 5,
                          width: 5,

                        ),
                        SizedBox(width: 19.w,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(StringManger.walletBalance.tr(),
                                  style:  Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManger.whiteColor),),
                                SizedBox(width: 6.w,),
                                SvgPicture.asset(AssetManger.walletIcon),
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            // Text(state.profile.wallet??"",
                            //   style:  Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManger.whiteColor),),

                          ],
                        ),


                      ],
                    ),
                  ),
                  SizedBox(width: 5.w,),



                ],),
            ),
          );
        }else if(state is ProfileLoading){
          return const Center(child: CustomLoadingIndicator());
        }else if(state is ProfileErrorState){
          return Center(child: Text(state.message??''));
        }else{

          return   Center(child: Image.asset("assets/images/noData.png"));
        }
       },

    );
  }
}
