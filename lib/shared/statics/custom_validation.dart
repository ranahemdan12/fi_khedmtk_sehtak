import 'package:easy_localization/easy_localization.dart';
import 'package:string_validator/string_validator.dart';
import '../resources/strings_manger.dart';

class CustomValidation {


  static String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])');

    //r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    if (value?.isEmpty==true) {
      return StringManger.required.tr();
    } else if (value!.length < 6) {
      return StringManger.passwordShort.tr();
    } else {
      if (!regex.hasMatch(value)) {
        return StringManger.enterValidPassword.tr();
      } else {
        return null;
      }
    }
  }


  static String? validateName(String? value) {
    return value == null || value.isEmpty ? StringManger.required.tr() : null;
  }



  static String? validateEmail(String? value) {


    if (value!.isEmpty) {
      return StringManger.required.tr();
    } else {
      if (isEmail(value)==false) {
        return StringManger.enterValidEmail.tr();
      } else {
        return null;
      }
    }


  }
}
