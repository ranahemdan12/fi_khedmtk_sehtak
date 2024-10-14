import '../clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../package/get_package.dart';

class  GetHospitalsBranchesServiceResponse{
  int? count;
  String? next;
  String? previous;
  ResultModel? result;
  AppointmentModel?appointmentModel;

  GetHospitalsBranchesServiceResponse(
      {this.count, this.next, this.previous, this.result,this.appointmentModel});

  factory GetHospitalsBranchesServiceResponse.fromJson(Map<String, dynamic> json) {
    print(json['appointments']);
    return GetHospitalsBranchesServiceResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: ResultModel.fromJson(jsonList: json['results']),
      appointmentModel: AppointmentModel.fromJson(jsonList: json['appointments']),
    );
  }

}

class ResultModel {
  List<BranchServiceResultItem>  branchService;

  ResultModel({this. branchService = const []});

  factory ResultModel.fromJson({required List jsonList}) {
    return ResultModel(
        branchService: jsonList.map((e) => BranchServiceResultItem.fromJson(e)).toList());
  }
}


class BranchServiceResultItem{

  int? id;
  int? branch;
  String? services;
  String? serviceFee;
  String? sehtakFee;
  AppointmentModel? appointment;
  String? type;
  int? specialization;
  ClinicsResultItem? doctor;


  BranchServiceResultItem({this.id,this.services,this.sehtakFee,this.branch,this.serviceFee,this.type,
    this.specialization,
    this.appointment,
    this.doctor});

  factory  BranchServiceResultItem.fromJson(Map<String,dynamic>jsonData){
    return BranchServiceResultItem(

      id: jsonData['id'],
      branch: jsonData['branch'],
      services: jsonData['services'],
      serviceFee: jsonData['service_fee'],
      sehtakFee: jsonData['sehtak_fee'],
      type: jsonData['type'],
      specialization: jsonData['Specialization'],
      appointment:
      AppointmentModel.fromJson(jsonList: jsonData['appointments']),
      doctor: jsonData['doctor']== null ? null: ClinicsResultItem.fromJson(jsonData['doctor']),



    );
  }

}



class GetHospitalsServiceBranchesErrorResponse {
  String? message;

  GetHospitalsServiceBranchesErrorResponse({this.message});

  GetHospitalsServiceBranchesErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}