import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/enum.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/lab_filtter_cubit/labs_filtter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../select_region_screen/cubit/region_cubit.dart';
import '../cubit/labs_cubit/labs_cubit.dart';
import '../widgets/lab_branch_list_view.dart';
import '../widgets/lab_branch_sheet.dart';



class LabBranchesScreen extends StatefulWidget {
  const LabBranchesScreen({super.key});

  @override
  State<LabBranchesScreen> createState() => _LabBranchesScreenState();
}

class _LabBranchesScreenState extends State<LabBranchesScreen> {
  late final ScrollController _scrollController;
  ServiceType? serviceType;
  MapTypeEnum? mapTypeEnum;

  @override
  void initState() {
    LabsCubit.get(context).getLabs(reset: true,);
    LabsFilterCubit.get(context).resetAllFilter();
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      LabsCubit.get(context).getLabs();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
    
  }


  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.labsBranch.tr(),
        actionWidget: Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: IconButton(
              onPressed: () {  showSheet(context); },
              icon: SvgPicture.asset(
                AssetManger.whiteFilterIcon,
              )),
        ),
        body: Column(
          children: [
            SizedBox(height: 16.h),
            const LabBranchListView(),
          ],
        ));
  }
}

void showSheet(context) {
  RegionCubit.get(context). resetSelectedCityRegion();
  showModalBottomSheet(
      backgroundColor: ColorManger.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return const LabBranchSheet();
      });
}
