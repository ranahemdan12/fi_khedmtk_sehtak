import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../package_cubit/package_cubit.dart';
import '../widget/package_list_view.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {

  late ScrollController _scrollController;


  @override
  void initState() {
   PackageCubit.get(context).getPackage(reset: true);
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }
  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      PackageCubit.get(context).getPackage();
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
    return CustomScreen(text: StringManger.packages.tr(), body: Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics:  const PageScrollPhysics(),
            controller: _scrollController,
            slivers:  const [
              PackageListView(),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    ));
  }
}
