import '../clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';

class FilterClinicLocationsErrorResponse{
  String? message;
  FilterClinicLocationsErrorResponse({required this.message});
  factory FilterClinicLocationsErrorResponse.fromJson({required Map<String,dynamic> json}){
   return FilterClinicLocationsErrorResponse(
       message: json['message']
    );
  }
}


class FilterClinicLocationsSuccessResponse{
  ResultModel? doctors;
  FilterClinicLocationsSuccessResponse({ this.doctors});

 factory FilterClinicLocationsSuccessResponse.fromJson({required List jsonList}){

   return FilterClinicLocationsSuccessResponse(
      doctors: ResultModel.fromJson(jsonList: jsonList)
    );
  }
}


