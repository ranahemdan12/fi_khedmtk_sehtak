import 'package:flutter/material.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../signup_screen/screen/signup_screen.dart';


class SignUpText extends StatelessWidget {
   SignUpText({Key? key,required this.text}) : super(key: key);

  String? text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
      },
      child: Text(
        text!,

        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blueColor)
      ),
    );
  }
}
