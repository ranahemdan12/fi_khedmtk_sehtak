import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/response/labs/labs_response.dart';
import '../../../select_region_screen/cubit/region_cubit.dart';
part 'labs_filtter_state.dart';


class LabsFilterCubit extends Cubit<LabsFilterState> {
  LabsFilterCubit() : super(LabsFilterInitial());

  static LabsFilterCubit get(context) =>BlocProvider.of(context);

  LabsBranches labsBranches=LabsBranches();
  RegionCubit regionCubit=RegionCubit();


  late RangeValues currentRangeValues ;

  bool validate({int? city, int? region}) {
    return ((city!=null || region!=null)||
        orderBy.isNotEmpty  ||
        minFees != null || maxFees != null);
  }

  double? minFees;
  double? maxFees;

  resetAllFilter({double? minFees, double? maxFees}){
    resetMinFees(minFees,maxFees);
    resetOrderBy();
  }

  setMinMaxFees(double? minFees,double? maxFees,bool selected){
    // if(selected){
    this.minFees=minFees;
    this.maxFees=maxFees;
    // }
    currentRangeValues = RangeValues(minFees??0.0,maxFees??0.0);
    emit(LabsFilterInitial());
  }

  resetMinFees(double? minFees,double? maxFees){
    this.minFees=null;
    this.maxFees=null;
    currentRangeValues = RangeValues(minFees??0,maxFees??0.0);
    emit(LabsFilterReset());
  }




  String orderBy='';
  setOrderBy(String labsSort){
    orderBy=labsSort;
    emit(LabsFilterInitial());
  }
  resetOrderBy(){
    orderBy='';
    emit(LabsFilterReset());
  }
}
