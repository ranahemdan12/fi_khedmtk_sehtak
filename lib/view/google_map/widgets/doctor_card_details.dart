import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MapCardData {
  final String image;
  final String name;

  MapCardData(
  {required this.image,required this.name,});
}



class DoctorCardDetails extends StatelessWidget {
  DoctorCardDetails(
      {required this.mapCardData,
        required this.onTap,

      super.key});

  MapCardData mapCardData;
  void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: REdgeInsets.only(left: 10),
            width: 295.w,
            height: 170.h,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SizedBox(height: (90.h / 2)),
                Text(
                  mapCardData.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: ColorManger.blackColor),
                ),
                // const RateWidget(),
                Text(
                  '',
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ColorManger.blackColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 170.h - (77.h / 2),
            child: mapCardData.image.isNotEmpty == true
                ? CustomCachedNetworkImage(imageUrl: mapCardData.image ?? '',
             height: 60.h, width: 60.w, borderRadius: 50,
              fit: BoxFit.cover,
            )
                : Container(
                    width: 77.w,
                    height: 77.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        //color: Colors.red
                        image: DecorationImage(
                            image: AssetImage('assets/icons/IMG-20240716-WA0020.jpg'),
                            fit: BoxFit.cover)),
                  ),
          )
        ],
      ),
    );
  }
}
