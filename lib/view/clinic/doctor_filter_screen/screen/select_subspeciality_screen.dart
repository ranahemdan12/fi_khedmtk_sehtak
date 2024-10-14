import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/service_locator.dart';
import '../cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../cubit/supspecialization_cubit/subspecialize_cubit.dart';
import '../widget/done_text.dart';
import '../widget/sub_speciality_listview.dart';



class SubSpecialityScreen extends StatefulWidget {
  const SubSpecialityScreen({super.key});

  @override
  State<SubSpecialityScreen> createState() => _SubSpecialityScreenState();
}

class _SubSpecialityScreenState extends State<SubSpecialityScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.selectSubSpecialty.tr(),
        actionWidget: Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: TextButton(
            onPressed: _navigateToSubScreen,
            child: const DoneText(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: CustomTextField(
                suffixIcon: isClicked,
                onPresed: () {

                  setState(() {
                    searchController.clear();
                    isClicked = true;
                    SubSpecializeCubit.get(context).resetSubSpecialization();
                  });
                },
                keyboardType: TextInputType.text,
                textEditingController: searchController,
                hintText: StringManger.search.tr(),
                text: '',
                onChanged: (searchValue) {
                  SubSpecializeCubit.get(context)
                      .filterSubSpecialization(filterVal: searchValue);

                  if (searchValue.isNotEmpty) {
                    setState(() {
                      isClicked = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            const Expanded(child: SubSpecialityListView()),
          ],
        ));
  }


  void _navigateToSubScreen(){
    DoctorFilterCubit.get(context).selectedSubSpecializations;
    sl<NavigationService>().pop();
  }
}
