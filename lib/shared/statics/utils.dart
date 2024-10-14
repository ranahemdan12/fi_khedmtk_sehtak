import 'package:flutter/material.dart';

class Utils{
  static String getCleansedPhoneNumber(
      {required String phoneNumber, String? countryCode}) {
    String cleansedPhoneNumber = phoneNumber;
    // check country code
    if (countryCode != null &&
        countryCode.isNotEmpty &&
        cleansedPhoneNumber.contains(countryCode)) {
      final stringSplit = phoneNumber.split(countryCode);
      cleansedPhoneNumber = stringSplit.last;
    }
    // check if the phone number starts with leading 0
    if (cleansedPhoneNumber.startsWith('0')) {
      cleansedPhoneNumber = cleansedPhoneNumber.substring(1);
      debugPrint(
          '-------------- cleansedPhoneNumber substring:: $cleansedPhoneNumber ----------------');
    }
    debugPrint(
        '---------------- cleansedPhoneNumber:: $cleansedPhoneNumber --------------------');
    // check if the phone number contains white spaces
    return cleansedPhoneNumber.replaceAll(' ', '');
  }
}