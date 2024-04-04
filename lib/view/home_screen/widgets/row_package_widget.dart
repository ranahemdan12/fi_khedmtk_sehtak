import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';




class RowPackageWidget extends StatelessWidget {
  const RowPackageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringManger.packages,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.packagesScreen);
            },
            child: Text(
              StringManger.seeAll,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

        ],
      ),
    );
  }
}
