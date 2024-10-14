import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
import '../cubit/doctor_filter_cubit/doctor_filter_cubit.dart';

class FeesSlider extends StatefulWidget {
  const FeesSlider({super.key});

  @override
  State<FeesSlider> createState() => _FeesSliderState();
}

class _FeesSliderState extends State<FeesSlider> {
  late RangeValues _currentRangeValues;

  late final double? min;
  late final double? max;


  @override
  void initState() {
    setMinMax();
    super.initState();
  }

  setMinMax() {
    min =
        DoctorsInSpecialityCubit.get(context)
            .getClinicsBySpecialityResponse
            .minSehtakFees;
    max =  DoctorsInSpecialityCubit.get(context)
            .getClinicsBySpecialityResponse
            .maxSehtakFees;
    (DoctorFilterCubit.get(context).maxFees == null ||
                DoctorFilterCubit.get(context).minFees == null) &&
            min != null
        ? DoctorFilterCubit.get(context).setMinMaxFees(min, max,false)
        : {};
    _currentRangeValues = DoctorFilterCubit.get(context).currentRangeValues;
    print(
        'current Range ${_currentRangeValues.start} : ${_currentRangeValues.end} ------ min ${min} : max ${max}');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorFilterCubit, DoctorFilterState>(
      listener: (BuildContext context, DoctorFilterState state) {
        if (state is FilterResetState) {
          setState(() {
            _currentRangeValues = RangeValues(
                DoctorsInSpecialityCubit.get(context)
                        .getClinicsBySpecialityResponse
                        .minSehtakFees ??
                    0,
                DoctorsInSpecialityCubit.get(context)
                        .getClinicsBySpecialityResponse
                        .maxSehtakFees ??
                    5000);
          });
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 28,
              end: 28,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$min${StringManger.egp.tr()}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "$max${StringManger.egp.tr()}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),

          RangeSlider(
            min: min ?? 0,
            values: _currentRangeValues,
            max: max ?? 5000 + 1,

            activeColor: ColorManger.blueColor,
            inactiveColor: ColorManger.greySColor,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                DoctorFilterCubit.get(context)
                    .setMinMaxFees(values.start, values.end,true);
                _currentRangeValues =
                    DoctorFilterCubit.get(context).currentRangeValues;
              });
            },
          )

        ],
      ),
    );
  }
}
