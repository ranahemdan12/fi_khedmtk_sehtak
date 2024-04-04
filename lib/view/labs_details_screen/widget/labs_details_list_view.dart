import 'package:flutter/material.dart';

import '../../../shared/statics/reusable_component.dart';

class LabsDetailsListView extends StatelessWidget {
  const LabsDetailsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: ( context,  index) => GestureDetector(
        onTap: (){

        },
        child:  Padding(
          padding:EdgeInsetsDirectional.only(bottom: 15),
          child: CustomServiceContainer(text1: 'Blood Urea (Urea or BUN )', richText1: 'In case of cash ', richText2: '200 EGP', richText3: 'Booking through the application is ', richText4: '50 EGP ',),
        ) ,
      ),
      itemCount: 9,);
  }
}
