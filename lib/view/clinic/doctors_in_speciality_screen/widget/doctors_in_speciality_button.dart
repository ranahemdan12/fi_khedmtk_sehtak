import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/resources/color_manger.dart';


//ignore: must_be_immutable
class CustomDermatologyButton extends StatelessWidget {
  CustomDermatologyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.svgPic,
  }) : super(key: key);

  void Function()? onPressed;
  String text;
  String svgPic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManger.blueColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgPic,
              colorFilter:
              const ColorFilter.mode(ColorManger.whiteColor, BlendMode.srcIn),
            // color: ColorManger.whiteColor,
            ),
            SizedBox(width: 4.w,),
            Text(
              text,
             style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
