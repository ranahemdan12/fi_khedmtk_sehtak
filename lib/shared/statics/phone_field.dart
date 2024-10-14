import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../resources/color_manger.dart';



class PhoneField extends StatelessWidget {
  final void Function(PhoneNumber)? onInputChanged;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction action;
  final void Function(Country)? onCountryChanged;

  const PhoneField(
      {Key? key,
        this.onInputChanged,
        required this.controller,
        this.onCountryChanged,
        this.focusNode,
        this.action = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 50.h,
      child: IntlPhoneField(

        // inputFormatters: CustomTextInputFormatter.phoneFormatter,

        textAlign: /* TextAlign.start :*/ TextAlign.start,
        countries: const [
          Country(
            name: "Egypt",
            nameTranslations: {
              "sk": "Egypt",
              "se": "Egypt",
              "pl": "Egipt",
              "no": "Egypt",
              "ja": "エジプト",
              "it": "Egitto",
              "zh": "埃及",
              "nl": "Egypt",
              "de": "Ägypt",
              "fr": "Égypte",
              "es": "Egipt",
              "en": "Egypt",
              "pt_BR": "Egito",
              "sr-Cyrl": "Египат",
              "sr-Latn": "Egipat",
              "zh_TW": "埃及",
              "tr": "Mısır",
              "ro": "Egipt",
              "ar": "مصر",
              "fa": "مصر",
              "yue": "埃及"
            },
            flag: "🇪🇬",
            code: "EG",
            dialCode: "20",
            minLength: 10,
            maxLength: 11,
          ),
        ],

        // inputFormatters:CustomTextInputFormatter.phoneFormatter,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counterText: "",
          // hintText: StringsManager.PhoneNumber.tr(),
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
          filled: true,
          isDense: true,
          isCollapsed: true,
          fillColor: Colors.white,
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 14.sp, color: ColorManger.redColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManger.blackColor,
              width: 0.2.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.2.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: ColorManger.redColor),
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 20.sp, color: ColorManger.blackColor,fontWeight: FontWeight.w500),
        keyboardType: TextInputType.phone,
        initialCountryCode: "EG",
        invalidNumberMessage: StringManger.invalidNumber.tr(),
        textInputAction: action,
        cursorColor: ColorManger.blackColor,
        dropdownIconPosition: IconPosition.leading,
        showDropdownIcon: false,
        verticalDividerWidth: 0.5.w,
        heightVerticalDivider: 32.h,
        addVerticalDivider: true,
        dividerColor: Theme.of(context).secondaryHeaderColor,
        flagRadius: 2.r,
        showFlagImage: true,
        flagWidth: 20.w,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.disabled,
        flagPadding: REdgeInsets.only(left: 10),
        dropdownTextStyle: Theme.of(context).textTheme.bodySmall,
        onCountryChanged: onCountryChanged,
        onChanged: onInputChanged,
        pickerDialogStyle: PickerDialogStyle(

            searchStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorManger.blackColor,
            ),
            searchFieldInputDecoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide.none),

              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding:  REdgeInsets.only(left: 10, right: 10),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 14.sp),
              prefixIcon:  const Icon(
                Icons.search,
                color: ColorManger.blackColor,
              ),
              hintText: '',
            ),
            backgroundColor: Theme.of(context).canvasColor,
            countryCodeStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 14.sp, color: ColorManger.blackColor),
            countryNameStyle:
            Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.sp)),
      ),
    );
  }
}