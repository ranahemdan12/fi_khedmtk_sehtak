import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../pharmacy_search_cubit/pharmacy_search_cubit.dart';


class PharmacyListView extends StatefulWidget {
  const PharmacyListView({super.key});

  @override
  State<PharmacyListView> createState() => _PharmacyListViewState();
}


class _PharmacyListViewState extends State<PharmacyListView> {
  @override
  void initState() {


    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<PharmacySearchCubit, PharmacySearchState>(
        builder: (context, state) {
          if (state is PharmacySearchLoadingState) {
             return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child:
               ListView.builder(
                   itemCount: 20, // Adjust the count based on your needs
                    itemBuilder: (context, index) {
                      return Container(                     decoration: BoxDecoration(
                          color: ColorManger.whiteGColor,
                          borderRadius: BorderRadius.circular(8),
                      ),
                       width: 338.w,
                        height: 50.h,
                       margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        padding: const EdgeInsets.all(8),
                    );
                   }),
              );
            }
          else if(state is PharmacySearchSuccessState) {

            return ListView.builder(
              // controller: _scrollController,
              itemBuilder: (context, index) {
                return    Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16,bottom: 8,top: 8),
                  child: Container(
                    // width: 358.w,
                    decoration: BoxDecoration(
                      color: ColorManger.whiteDColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorManger.mainColor,),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8,end: 16,bottom: 16,top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(  crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomCachedNetworkImage(imageUrl: state.model.resultItem[index].user?.image??"", height:  45.h, width:45.w, borderRadius:45,fit: BoxFit.cover,),
                              SizedBox(width: 8.w,),
                              Text(state.model.resultItem[index].pharmacyName??'',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: ColorManger.blackColor
                                ),


                              )

                            ],
                          ),
                          SizedBox(height: 16.h,),
                          Row(
                            children: [
                              SvgPicture.asset(AssetManger.cLocationIcon),
                              SizedBox(width: 4.w,),

                              Text(state.model.resultItem[index].address??'',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    color: ColorManger.greyProfileColor
                                ),


                              ),
                            ],
                          )



                        ],
                      ),
                    ),
                  ),
                );


              },
              itemCount:state.model.resultItem.length,
            );
          } else if (state is PharmacySearchErrorState) {

            // print('${"message is"}${state.message}');
            return Text('${state.message}');
          } else {
            return const SizedBox();
          }
        });
  }

}
