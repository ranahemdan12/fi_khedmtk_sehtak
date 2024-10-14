import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/widget/hospital_text_field.dart';
import 'package:fi_khedmtk_sehtak/view/select_region_screen/cubit/region_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/resources/color_manger.dart';
import '../cubit/hospital_cubit/hospitals_cubit.dart';
import '../widget/hospital_list_view.dart';
import '../widget/hospital_sheet.dart';


class HospitalsScreen extends StatefulWidget {
  const HospitalsScreen({super.key});

  @override
  State<HospitalsScreen> createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
  late ScrollController _scrollController;
  TextEditingController controller = TextEditingController();
  late HospitalsCubit hospitalsCubit;

  @override
  void initState() {
    hospitalsCubit = HospitalsCubit.get(context)..initializeSearch();
    hospitalsCubit.getHospitalsBranches(reset: true,);
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      hospitalsCubit.getHospitalsBranches();
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
        text: StringManger.hospitals.tr(),
        actionWidget: Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: IconButton(
              onPressed: () {
                showSheet(context);
              },
              icon: SvgPicture.asset(
                AssetManger.whiteFilterIcon,
              )),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
            HospitalTextField(
              textEditingController: controller,
              onChanged: (value) {
                _searchHospitals(
                    cubit: hospitalsCubit, page: 1, text: value);
              },
            ),
              SizedBox(
                height: 16.h,
              ),
              const HospitalListView(),

            ],
          ),
        ));
  }
}

void _searchHospitals(
    {required HospitalsCubit cubit,
    required int page,
    required String text}) async {
  final searchText = text;
  cubit.searchControllerChannel.sink.add({
    'searchValue': searchText,
    'searchPage': page,
  });
}

void showSheet(context) {
  RegionCubit.get(context). resetSelectedCityRegion();
  showModalBottomSheet(
      backgroundColor: ColorManger.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return const HospitalSheet();
      });
}
