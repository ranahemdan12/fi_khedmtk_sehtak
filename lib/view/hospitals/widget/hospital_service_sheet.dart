import 'package:fi_khedmtk_sehtak/view/hospitals/widget/service_filter_button.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/widget/show_sheet_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HospitalServiceSheet extends StatelessWidget {
  const HospitalServiceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 274.h,
      width: 390.w,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          end: 28,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 19.h,
            ),
            const ServiceFilterButton(),
            const ShowSheetColumn(),
          ],
        ),
      ),
    );
  }
}
