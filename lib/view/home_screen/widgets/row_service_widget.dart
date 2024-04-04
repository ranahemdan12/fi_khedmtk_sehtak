import 'package:flutter/material.dart';



import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';



class RowServiceWidget extends StatelessWidget {
  const RowServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringManger.services,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.serviceScreen);
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
