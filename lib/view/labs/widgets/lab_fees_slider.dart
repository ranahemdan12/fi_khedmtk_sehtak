import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/lab_filtter_cubit/labs_filtter_cubit.dart';
import '../cubit/labs_cubit/labs_cubit.dart';



class LabsFeesSlider extends StatefulWidget {
  const LabsFeesSlider({super.key});

  @override
  State<LabsFeesSlider> createState() => _LabsFeesSliderState();
}

class _LabsFeesSliderState extends State<LabsFeesSlider> {

  late RangeValues _currentRangeValues;
  late final double? min;
  late final double? max;

  @override
  void initState() {
    setMinMax();
    super.initState();
  }

  setMinMax() {
    min =LabsCubit.get(context)
        .labsBranches
        .minSehtakFees;
    max =  LabsCubit.get(context)
        .labsBranches
        .maxSehtakFees;
    (LabsFilterCubit.get(context).maxFees == null ||
        LabsFilterCubit.get(context).minFees == null) &&
        min != null
        ? LabsFilterCubit.get(context).setMinMaxFees(min, max,false)
        : {};
    _currentRangeValues = LabsFilterCubit.get(context).currentRangeValues;

  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<LabsFilterCubit,LabsFilterState>(
      listener: (BuildContext context, LabsFilterState state) {
        if(state is LabsFilterReset){

            setState(() {
              _currentRangeValues = RangeValues(
                  LabsCubit.get(context)
                      .labsBranches
                      .minSehtakFees ??
                      0,
                  LabsCubit.get(context)
                      .labsBranches
                      .maxSehtakFees ??
                      5000);
            });
          }

      },
      child: Column(
        children: [
          Padding(
            padding:const EdgeInsetsDirectional.only(start:28 ,end:28 ,),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$min${StringManger.egp.tr()}",
                  style:Theme.of(context).textTheme.titleSmall,),
                Text("$max${StringManger.egp.tr()}",
                  style:Theme.of(context).textTheme.titleSmall,),
              ],),
          ),

          RangeSlider(
            min:min ?? 0.0,
            values: _currentRangeValues,
            max: max ?? 5000.0 + 1,
            // divisions: 20,
            activeColor: ColorManger.blueColor,
            inactiveColor:  ColorManger.greySColor,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {

              setState(() {
                LabsFilterCubit.get(context)
                    .setMinMaxFees(values.start, values.end,true);
                _currentRangeValues =
                    LabsFilterCubit.get(context).currentRangeValues;

              });

            },
          )

        ],
      ),
    );
  }
}