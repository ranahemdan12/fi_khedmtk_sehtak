import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key, required this.textEditingController, required this.keyboardType,
    required this.hintText,required this.text,this.enabled,
    required this.validate,
  });



  final TextEditingController textEditingController;
  final String? Function(String?)? validate;
  final TextInputType keyboardType;
  final String? hintText;
  final String text;
  final bool? enabled;

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {


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
          // height: 60.h,
          child: TextFormField(
            validator: widget.validate,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(
                  start: 25, ),
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
              // disabledBorder:const OutlineInputBorder(
              //   borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              // ),
              fillColor: ColorManger.whiteGColor,
              filled: true,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ColorManger.blueGColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}