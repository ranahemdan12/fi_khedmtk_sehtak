import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';

class ProfileTextField extends StatefulWidget {
  const ProfileTextField({super.key, required this.textEditingController, required this.keyboardType,
    required this.hintText,required this.text,this.enabled,});



  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String? hintText;
  final String text;
  final bool? enabled;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
        SizedBox(
          height: 60.h,
          child: TextField(
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(
                  start: 25, top: 15, bottom: 15),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorManger.blueColor),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              fillColor: ColorManger.whiteGColor,
              filled: true,


              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: ColorManger.labelGrayColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
