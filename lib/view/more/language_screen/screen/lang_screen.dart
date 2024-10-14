import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/resources/color_manger.dart';
import '../../../../../shared/resources/strings_manger.dart';
import '../../../../../shared/statics/constants.dart';
import '../../../../../shared/statics/reusable_component.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String ?lang;

  @override
  void didChangeDependencies() {
    lang = context.isArabic? StringManger.arabic:StringManger.english;
    super.didChangeDependencies();
  }

  @override

  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.language.tr(), body: Padding(
      padding:const EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Column(children: [
        SizedBox(height: 45.h,),
        Container(
          decoration: BoxDecoration(border:Border.all(
            color:ColorManger.dividerColor,
          ),
          borderRadius: BorderRadius.circular(8)),
          child: RadioListTile(
            selectedTileColor: ColorManger.blueColor ,
            activeColor: ColorManger.blueColor,
            controlAffinity: ListTileControlAffinity.trailing,

            title: Text(StringManger.english.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManger.blackColor),),
            value: StringManger.english,
            groupValue: lang,
            onChanged: (value){
              if(lang!=value.toString()){
                context.setLocale( const Locale(Constants.enCode));
                setState(() {
                  lang = value.toString();

                }
                );
              }

            },
          ),
        ),
        SizedBox(height: 15.h,),
        Container(
          decoration: BoxDecoration(border:Border.all(
            color:ColorManger.dividerColor,
          ),
              borderRadius: BorderRadius.circular(8)),
          child: RadioListTile(
            selectedTileColor: ColorManger.blueColor ,
            activeColor: ColorManger.blueColor,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(StringManger.arabic.tr(),
              style:  Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManger.blackColor),
            ),
            value: StringManger.arabic,
            groupValue: lang,
            onChanged: (value){
              if(lang != value.toString()){
                setState(() {
                  lang = value.toString();
                  context.setLocale(
                      const Locale(Constants.arCode));
                });
              }

            },
          ),
        ),
      ],),
    ));
  }
}
