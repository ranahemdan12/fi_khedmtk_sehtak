import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import '../cubit/region_cubit.dart';
import '../widget/region_list_view.dart';

class SelectRegionScreen extends StatefulWidget {
  const SelectRegionScreen({Key? key}) : super(key: key);

  @override
  State<SelectRegionScreen> createState() => _SelectRegionScreenState();
}

class _SelectRegionScreenState extends State<SelectRegionScreen> {


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return CustomScreenWithSearchAppBar(
        text: RegionCubit.get(context).selectedCity?.cityName??"" ,
        onClose: RegionCubit.get(context).resetRegion,
        onChanged: (value){
          RegionCubit.get(context).filterRegion(filterVal: value);
        },


        body: const Column(children: [

          Expanded(child: RegionListView(),),
        ],));
  }
}
