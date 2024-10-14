import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/widget/hospital_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/enum.dart';
import '../cubit/hospital_service_details/hospital_service_details_cubit.dart';
import '../widget/hospital_service_details_list_view.dart';
import '../widget/hospital_service_sheet.dart';



//ignore: must_be_immutable
class HospitalsServicesDetailsScreen extends StatefulWidget {
  const HospitalsServicesDetailsScreen({super.key});


  @override
  State<HospitalsServicesDetailsScreen> createState() =>
      _HospitalsServicesDetailsScreenState();
}

class _HospitalsServicesDetailsScreenState
    extends State<HospitalsServicesDetailsScreen> {

  late ScrollController _scrollController;
  TextEditingController controller = TextEditingController();

  late HospitalServiceDetailsCubit hospitalsServiceCubit;
  ReserveOrderTypeEnum? reserveOrderTypeEnum;
  HospitalServiceEnum? hospitalServiceEnum;

  int? categoryId;

  @override
  void initState() {
    hospitalsServiceCubit = HospitalServiceDetailsCubit.get(context)
      ..initializeSearch();
    hospitalsServiceCubit.getHospitalsServiceBranches(
      reset: true,
    );
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      hospitalsServiceCubit.getHospitalsServiceBranches();
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
        text: StringManger.services.tr(),
        actionWidget: HospitalServiceEnum.clinics ==
                HospitalServiceDetailsCubit.get(context).hospitalServiceEnum
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: IconButton(
                    onPressed: () {
                      showSheet(context);
                    },
                    icon: SvgPicture.asset(
                      AssetManger.whiteFilterIcon,
                    )),
              )
            : null,
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
                cubit: hospitalsServiceCubit, page: 1, text: value);
                 },
              ),
              SizedBox(
                height: 16.h,
              ),
              const HospitalServiceDetailsListView(),

            ],
          ),
        ));
  }
}

void _searchHospitals(
    {required HospitalServiceDetailsCubit cubit,
    required int page,
    required String text}) async {
  final searchText = text;

  cubit.searchControllerChannel.sink.add({
    'searchValue': searchText,
    'searchPage': page,
  });
}

void showSheet(context) {
  showModalBottomSheet(
      backgroundColor: ColorManger.whiteColor,
      context: context,
      builder: (BuildContext context) {
        return const HospitalServiceSheet();
      });
}
