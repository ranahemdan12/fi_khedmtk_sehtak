import 'package:flutter/material.dart';






import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/package_list_view.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.packages, body: Column(
      children: [
      Expanded(child: PackageListView()),
      ],
    ));
  }
}
