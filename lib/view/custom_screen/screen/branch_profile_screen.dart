import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/enum.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/response/hospitals/get_hospitals_branches.dart';
import '../../../models/response/labs/labs_response.dart';




class BranchProfileScreen extends StatefulWidget {
  const BranchProfileScreen({super.key});

  @override
  State<BranchProfileScreen> createState() => _BranchProfileScreenState();
}

class _BranchProfileScreenState extends State<BranchProfileScreen> {

  // ProfileEnum? profileEnum;
  HospitalResultItem? hospitalResultItem;
  LabsResultsItem? labsResultsItem;
  @override
  void didChangeDependencies() {
    hospitalResultItem = ModalRoute.of(context)!.settings.arguments as HospitalResultItem;


    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      text: hospitalResultItem?.hospital?.user?.firstName,
      // profileEnum == ProfileEnum.hospitals?hospitalResultItem?.hospital?.user?.firstName:
      //   profileEnum == ProfileEnum.labs?StringManger.labs.tr():
      //   profileEnum == ProfileEnum.scan?StringManger.scan.tr():
      //  profileEnum == ProfileEnum.physical?StringManger.physicalTherapy.tr():'',

        body: SingleChildScrollView(
          child: Column(children: [

            SizedBox(height: 24.h,),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 7),
              child: ListTile(
                leading:  ClipRRect(
                  borderRadius:
                  BorderRadius.circular(7),
                  child: CachedNetworkImage(
                    imageBuilder: (context,
                        imageProvider) =>
                        Image(
                          image: imageProvider,
                          height: 60.h,
                          width: 60.w,
                          fit: BoxFit.cover,
                        ),
                    imageUrl:
                        hospitalResultItem?.hospital?.user?.image??'',
                        // profileEnum == ProfileEnum.labs && ServiceType==ServiceType.lab?labsResultsItem?.branch?.user?.image:
                        // profileEnum == ProfileEnum.scan && ServiceType==ServiceType.scan?labsResultsItem?.branch?.user?.image:
                        // profileEnum == ProfileEnum.physical && ServiceType==ServiceType.therapies?labsResultsItem?.branch?.user?.image:,



                    width: 60.w,
                    height: 60.h,
                    placeholder: (context, url) =>
                    const Center(
                        child:
                        CircularProgressIndicator()),
                    errorWidget: (context, url,
                        error) =>
                    const Icon(Icons.error),
                  ),
                ),
                title: Text(hospitalResultItem?.hospital?.user?.firstName??'',
                  // profileEnum == ProfileEnum.hospitals? hospitalResultItem?.hospital?.user?.firstName??'':
                  // profileEnum == ProfileEnum.labs?StringManger.labs.tr():
                  // profileEnum == ProfileEnum.scan?StringManger.scan.tr():
                  // profileEnum == ProfileEnum.physical?StringManger.physicalTherapy.tr():
                  //    ''  ,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: ColorManger.blackColor
                ),
                ),
                trailing: Material(
                  shadowColor:ColorManger.greyRColor ,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(40),
                  child: SvgPicture.asset(AssetManger.branchProfileCallIcon,

                  matchTextDirection: true,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 23),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsetsDirectional.only(
                        start: 0),
                    horizontalTitleGap: 4,
                    dense: true,
                    // dense: true,

                    leading:SvgPicture.asset(AssetManger.branchLocationIcon,
                    matchTextDirection: true,) ,
                    title: Text(StringManger.location.tr(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ColorManger.blueColor,
                    ),
                    ),
                  ),
                  SizedBox(height: 4.w,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 28),
                        child: Text( '${hospitalResultItem?.city}'',''${hospitalResultItem?.region}' ??'',
                          // profileEnum == ProfileEnum.hospitals? '${hospitalResultItem?.city}'',''${hospitalResultItem?.region}' ??'':
                          // profileEnum == ProfileEnum.labs?StringManger.labs.tr():
                          // profileEnum == ProfileEnum.scan?StringManger.scan.tr():
                          // profileEnum == ProfileEnum.physical?StringManger.physicalTherapy.tr():
                          // ''  ,

                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: ColorManger.greyProfileColor,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 8,end: 15),
                    child: Divider(
                      color: ColorManger.dividerColor,
                    ),
                  ),
                  // SizedBox(height: 10.h,),
                  ListTile(
                    contentPadding: const EdgeInsetsDirectional.only(start: 0),
                    horizontalTitleGap: 4,
                    dense: true,
                    leading:SvgPicture.asset(AssetManger.branchTimeIcon,
                      matchTextDirection: true,) ,
                    title: Text(StringManger.workingHours.tr(),
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: ColorManger.blueColor,
                      ),
                    ),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    // runSpacing: 5,
                    // spacing: 10,
                    children: List.generate(7,(index) {
                      return  Padding(
                                        padding: const EdgeInsetsDirectional.only(start: 13,),
                                        child: ListTile(
                                          dense: true,
                                            minTileHeight: 0,minVerticalPadding: 3,

                                            horizontalTitleGap: 60,
                                          leading: Text(
                                              '${hospitalResultItem?.city}',
                                            // profileEnum == ProfileEnum.hospitals? '${hospitalResultItem?.city}'',''${hospitalResultItem?.region}' ??'':
                                            // profileEnum == ProfileEnum.labs?StringManger.labs.tr():
                                            // profileEnum == ProfileEnum.scan?StringManger.scan.tr():
                                            // profileEnum == ProfileEnum.physical?StringManger.physicalTherapy.tr():
                                            // ''  ,

                                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: ColorManger.greyProfileColor,
                                                fontSize: 13
                                            ),),
                                          title: Row(
                                            children: [
                                              Text('10:00AM',
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                              color: ColorManger.greyProfileColor,
                                              fontSize: 13
                                          ),),
                                              Text('-',
                                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                    color: ColorManger.greyProfileColor,
                                                    fontSize: 13
                                                ),),
                                              Text('11:00PM',
                                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                    color: ColorManger.greyProfileColor,
                                                    fontSize: 13
                                                ),)])));
                    }, ),
                  ),

                  SizedBox(height: 12.h,),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 8,end: 15),
                    child: Divider(
                      color: ColorManger.dividerColor,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsetsDirectional.only(start: 0),
                    horizontalTitleGap: 4,
                    dense: true,
                    minVerticalPadding: 3,
                    leading:SvgPicture.asset(AssetManger.branchServiceIcon,
                      matchTextDirection: true,) ,
                    title: Text(StringManger.commonServices.tr(),
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: ColorManger.blueColor,
                      ),
                    ),
                  ),

                  SizedBox(
                    height:300.h,
                    child: ListView.builder(itemCount: 7,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.only(start: 28,end: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${hospitalResultItem?.city}',
                                      // profileEnum == ProfileEnum.hospitals? '${hospitalResultItem?.city}'',''${hospitalResultItem?.region}' ??'':
                                      // profileEnum == ProfileEnum.labs?StringManger.labs.tr():
                                      // profileEnum == ProfileEnum.scan?StringManger.scan.tr():
                                      // profileEnum == ProfileEnum.physical?StringManger.physicalTherapy.tr():
                                      // ''  ,

                                    style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blackProfileColor),),
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                const Divider( color: ColorManger.dividerColor,),
                                SizedBox(height: 15.h,),
                              ],
                            ),
                          );
                        }),
                  ),





                ],
              ),
            ),

          ],),
        ));
  }
}
