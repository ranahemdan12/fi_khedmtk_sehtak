import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/hospitals/get_hospitals_branches.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/reusable_component.dart';




class HospitalCard extends StatelessWidget {
  const HospitalCard({super.key,required this.hospitalResultItem});
  final HospitalResultItem? hospitalResultItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          bottom: 8),
      child: Container(
        width: 358.w,
        // height: 87.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteDColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManger.mainColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 16, top: 16, bottom: 15),
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              CustomCachedNetworkImage(
                  imageUrl: hospitalResultItem?.hospital?.user?.image ?? '',
                  height:  60.h, width: 60.w, borderRadius: 60,
                fit: BoxFit.cover,
              ),

              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalResultItem
                        ?.hospital
                        ?.user
                        ?.firstName ??
                        '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    '${hospitalResultItem?.city}'
                        " "
                        '${hospitalResultItem?.region}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                      fontSize: 16.sp,
                      color: ColorManger
                          .greyLColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
