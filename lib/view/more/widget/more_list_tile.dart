import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/color_manger.dart';



class MoreListTile extends StatelessWidget {
   MoreListTile({
    Key? key,
    required this.svgImage,
    required this.text,
    required this.onTap,
  }) : super(key: key);


  final String svgImage;
  final String text;
  void Function()? onTap;

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.whiteGColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorManger.blueColor,
            )),
        child: ListTile(
          minLeadingWidth: 0,
          titleAlignment: ListTileTitleAlignment.center,
          leading: SvgPicture.asset(
            svgImage,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.scaleDown,
          ),
          title: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium
          ),


        ),
      ),
    );
  }
}
