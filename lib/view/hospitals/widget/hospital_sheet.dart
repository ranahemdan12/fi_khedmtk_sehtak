import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'done_button.dart';
import 'govern_container.dart';
import 'map_container.dart';



class HospitalSheet extends StatelessWidget {
  const HospitalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 203.h,
      width: 390.w,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 28),
        child: Column(
          children: [
            SizedBox(
              height: 19.h,
            ),
            const DoneButton(),
            const GovernContainer(),
            SizedBox(
              height: 12.h,
            ),
            const MapContainer(),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}
