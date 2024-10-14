import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Lang on BuildContext {
  bool  get isArabic => locale.toString()=='ar';
}