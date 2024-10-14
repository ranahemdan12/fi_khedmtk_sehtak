import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../cubit/lab_filtter_cubit/labs_filtter_cubit.dart';

class PriceRadioTile extends StatefulWidget {
  const PriceRadioTile({super.key});

  @override
  State<PriceRadioTile> createState() => _PriceRadioTileState();
}

class _PriceRadioTileState extends State<PriceRadioTile> {

  String?lang;

  @override
  Widget build(BuildContext context) {
    lang = LabsFilterCubit
        .get(context)
        .orderBy;
    return BlocListener<LabsFilterCubit, LabsFilterState>(
      listener: (context, state) {
        if(state is LabsFilterReset){
          setState(() {
            lang='';
          });
        }
      },
      child: Row(
          children: [
            Row(

              children: [
                Radio(activeColor: ColorManger.blueColor,

                    value: StringManger.priceLowToHigh.tr(),
                    groupValue: lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                      LabsFilterCubit.get(context).setOrderBy(lang ?? '');
                    }),

                Text(
                  StringManger.priceLowToHigh.tr(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),

              ],
            ),
            Row(

              children: [
                Radio(activeColor: ColorManger.blueColor,

                    value: StringManger.priceHighToLow.tr(),
                    groupValue: lang,
                    onChanged: (value) {
                      setState(() {
                        lang = value.toString();
                      });
                      LabsFilterCubit.get(context).setOrderBy(lang ?? '');
                    }),

                Text(
                  StringManger.priceHighToLow.tr(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),

              ],
            ),

          ]
      ),
    );
  }
}
