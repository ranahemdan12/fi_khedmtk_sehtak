import '../hospitals/get_hospitals_branches.dart';

class FilterHospitalsLocationsErrorResponse{
  String? message;
  FilterHospitalsLocationsErrorResponse({required this.message});
  factory FilterHospitalsLocationsErrorResponse.fromJson({required Map<String,dynamic> json}){
    return FilterHospitalsLocationsErrorResponse(
        message: json['message']
    );
  }
}


class FilterHospitalsLocationsResponse{
  HospitalResultModel? doctors;
  FilterHospitalsLocationsResponse({ this.doctors});

  factory FilterHospitalsLocationsResponse.fromJson({required List jsonList}){

    return FilterHospitalsLocationsResponse(
        doctors: HospitalResultModel.fromJson(jsonList: jsonList)
    );
  }
}