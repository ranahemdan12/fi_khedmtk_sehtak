import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pharmacy_search_cubit/pharmacy_search_cubit.dart';
import '../widget/pharmacy_list_view.dart';
import '../widget/pharmacy_pop_up.dart';
import '../widget/pharmacy_textfield.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  void initState() {
    PharmacySearchCubit.get(context).getAllPharmacy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.pharmacy.tr(),
        body: const Padding(
          padding: EdgeInsetsDirectional.only(start: 16,top: 16,),
          child: Column(
            children: [
             Row(
               children: [
                 PharmacyTextField(),
                 // SizedBox(width: 8.w,),
                 PharmacyPopUp(),




               ],
             ),
              Expanded(child: PharmacyListView()),

            ],
          ),
        ));
  }
}
