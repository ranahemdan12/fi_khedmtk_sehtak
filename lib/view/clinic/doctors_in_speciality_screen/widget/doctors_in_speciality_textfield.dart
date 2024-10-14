import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';

class DoctorsInSpecialityTextField extends StatefulWidget {
  const DoctorsInSpecialityTextField({super.key ,this.onChanged,
    required this.textEditingController,});

  final Function(String)? onChanged;
  final TextEditingController textEditingController;
  @override
  State<DoctorsInSpecialityTextField> createState() => _DoctorsInSpecialityTextFieldState();
}

class _DoctorsInSpecialityTextFieldState extends State<DoctorsInSpecialityTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 48.h,
          child: TextField(
            onChanged: widget.onChanged,
            keyboardType: TextInputType.text,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.greyFieldColor, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.greyFieldColor, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: StringManger.search.tr(),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14.sp,
                color: ColorManger.greyHintColor,
              ),
              prefixIcon: const Icon(Icons.search,
                color: ColorManger.greyPrefColor,),
            ),


          ),
        ),
        SizedBox(
          height: 16.h,
        ),

      ],
    );
  }
}
