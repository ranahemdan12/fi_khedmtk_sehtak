import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/overall_text.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/rating_container.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/clinics_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/area_list_view.dart';
import '../widget/choose_text.dart';
import '../widget/row_coment.dart';
import '../widget/row_consul.dart';
import '../widget/custom_divider.dart';
import '../widget/row_default_order.dart';
import '../widget/expansion_column.dart';
import '../widget/row_overallrating .dart';
import '../widget/row_points.dart';
import '../widget/row_rating _container.dart';
import '../widget/row_rating.dart';
import '../widget/row_profile.dart';
import '../widget/time_solt_text.dart';
import '../widget/row_waiting.dart';

class SelectAreaScreen extends StatelessWidget {
  const SelectAreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.selectArea,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 29.h,
              ),
              RowProfile(),
              SizedBox(
                height: 13.h,
              ),
              CustomDivider(),
              SizedBox(
                height: 11.h,
              ),
              ConsulRow(),
              SizedBox(
                height: 11.h,
              ),
              WaitingRow(),
              SizedBox(
                height: 11.h,
              ),
              CustomDivider(),
              SizedBox(
                height: 8.h,
              ),
              ClinicsContainer(),
              SizedBox(
                height: 10.h,
              ),
              ChooseText(),
              SizedBox(
                height: 22.h,
              ),
              AreaListView(),
              SizedBox(
                height: 11.h,
              ),
              TimeSoltText(),
              CustomDivider(),
              SizedBox(
                height: 17.h,
              ),
              PointsRow(),
              SizedBox(
                height: 17.h,
              ),
              CustomDivider(),
              SizedBox(
                height: 9.h,
              ),
              RatingRow(),
              SizedBox(
                height: 9.h,
              ),
              ExpansionColumn(),
              SizedBox(
                height: 18.h,
              ),
              CustomDivider(),
              DefaultOrderRow(),
              SizedBox(
                height: 12.h,
              ),
              OverAllText(),
              SizedBox(
                height: 11.h,
              ),
              RatingContainerRow(),
              SizedBox(
                height: 13.h,
              ),
              OverALLRatingRow(),
              SizedBox(
                height: 13.h,
              ),
              CommentRow(),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26,end: 25),
                child: CustomButton(text: StringManger.viewMore, onPressed:(){}),
              ),
              SizedBox(
                height: 13.h,
              ),
            ],
          ),
        ));
  }
}
