import 'package:flutter/material.dart';

import '../../../../shared/resources/color_manger.dart';
class CustomText2 extends StatelessWidget {
  const CustomText2({Key? key,
    required this.text,}) : super(key: key);

  final  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodySmall);
  }
}