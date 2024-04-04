
import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.privacyPolicy, body: Column(children: [
      Text('dsfsdgsdgsdsfv'),
    ],));
  }
}
