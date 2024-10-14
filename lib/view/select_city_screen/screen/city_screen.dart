import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../cubit/city_cubit.dart';
import '../widget/city_listview.dart';



class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  @override
  void initState() {
    CityCubit.get(context).getCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreenWithSearchAppBar(
        text: StringManger.selectGovernorate.tr(),
        onChanged: (val) {
          CityCubit.get(context).filterCity(filterVal: val);
        },
        onClose: CityCubit.get(context).resetCity,

                body: const Column(
                  children: [
                    Expanded(
                       child: CityListView(),
            ),
          ],
        ));
  }
}
