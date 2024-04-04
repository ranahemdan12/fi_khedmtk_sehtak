import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/custom_service_column.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return CustomScreen(text: StringManger.services, body: Column(
        children: [
          CustomServiceColumn(),
        ],
      ));

  }
}
