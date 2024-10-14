import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../shared/resources/strings_manger.dart';




class RowServiceWidget extends StatelessWidget {
  const RowServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringManger.services.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),


        ],
      ),
    );
  }
}
