import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/widget/hospital_text_field.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_services_cubit/labs_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widgets/list_view.dart';



class LabsServicesScreen extends StatefulWidget {
  const LabsServicesScreen({Key? key}) : super(key: key);

  @override
  State<LabsServicesScreen> createState() => _LabsServicesScreenState();
}

class _LabsServicesScreenState extends State<LabsServicesScreen> {

  late LabsServicesCubit servicesCubit;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    servicesCubit = LabsServicesCubit.get(context)..initializeSearch();
    servicesCubit.getLabsServices(reset: true);
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  late final ScrollController _scrollController;


  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      servicesCubit.getLabsServices();
    }
  }


  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      text: StringManger.services.tr(),
      body: Column(
        children: [
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 18,end: 14,bottom: 16),
            child: HospitalTextField(
                textEditingController:controller,
                onChanged: (value) {
                _searchServices( cubit: servicesCubit, page: 1, text: value );
              },
            ),
          ),


          Expanded(
            child: CustomScrollView(
              physics: const PageScrollPhysics(),
              controller: _scrollController,
              slivers:  [
                ServicesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _searchServices({
      required LabsServicesCubit cubit,
      required int page,
      required String text
      }) async {

    final searchText = text;

    cubit.searchControllerChannel.sink.add({
      'searchValue': searchText,
      'searchPage': page,
    });
  }
}
