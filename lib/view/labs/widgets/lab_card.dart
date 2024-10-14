import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/labs/labs_response.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';



class LabCard extends StatelessWidget {
   const LabCard({super.key,required this.labsModel});
   final LabsResultsItem? labsModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsetsDirectional.only(
            bottom: 8, start: 16, end: 16),
        child: Container(
            width: 358.w,
            // height: 206.h,
            decoration: BoxDecoration(
              color: ColorManger.whiteDColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorManger.mainColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10,
                end: 10,
              ),
              child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.w,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        CustomCachedNetworkImage(
                            imageUrl: labsModel?.branch?.user?.image ?? "",
                            height: 60.h, width: 60.w, borderRadius: 50,
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
                              labsModel?.branch
                                  ?.user?.firstName ??
                                  '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: ColorManger
                                    .blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${labsModel?.branch?.city}'
                                  ' '
                                  '${labsModel?.branch?.region}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                  color: ColorManger
                                      .greyLColor,
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight
                                      .w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 13.w,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional
                          .only(start: 56),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                          text: StringManger
                              .priceBeforeDiscount
                              .tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                              color: ColorManger
                                  .blueColor,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                              text:
                              " ${labsModel?.serviceFee}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                  fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional
                          .only(start: 58),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                          text: StringManger
                              .priceAfterDiscount
                              .tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                            color:
                            ColorManger.blueColor,
                          ),
                          children: [
                            TextSpan(
                              text:
                              " ${labsModel?.sehtakFee}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                  color: ColorManger
                                      .redColor,
                                  fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    // Padding(
                    //   padding: const EdgeInsetsDirectional
                    //       .only(start: 56),
                    //   child: Text(
                    //     "${StringManger.youWill.tr()}""${state.labs[index].sehtakFee}""${StringManger.pointsAfter.tr()}",
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 1,
                    //     style: Theme.of(context).textTheme.labelMedium,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 8.w,
                    // ),
                  ]),
            ))

    );
  }
}
