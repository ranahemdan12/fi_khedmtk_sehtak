import '../clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';

class LabsServicesSuccessResponse {
  int? count;
  String? next;
  String? previous;
  List<LabServiceModel> services;
  LabsServicesSuccessResponse({this.services = const [], this.count, this.next, this.previous});
  factory LabsServicesSuccessResponse.fromJson({required Map<String, dynamic> json}) {
    return LabsServicesSuccessResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      services: (json['results'] as List)
          .map(
            (e) => LabServiceModel.fromJson(json: e),
          )
          .toList(),
    );
  }
}

class LabServiceModel {
  int? id;
  String? serviceName;
  String? serviceType;
  String? description;
  List<BranchServices>branchServices;

  LabServiceModel({this.id, this.branchServices=const[],this.description, this.serviceName,this.serviceType,});
  factory LabServiceModel.fromJson({required Map<String, dynamic> json}) {
    return LabServiceModel(
      id: json['id'],
      description: json['description'],
      serviceName: json['name'],
      serviceType: json['service_type'],
      branchServices: (json['branch_services']as List).map(
          (e)=>BranchServices.fromJson(json:e),
      ).toList(),
    );
  }
}

class BranchServices{

  int?id;
  int?branch;
  String?services;
  String?serviceFee;
  String?sehtakFee;
  AppointmentModel? appointment;
  String? type;
  int? specialization;
  ClinicsResultItem? doctor;

  BranchServices({this.branch,this.id,this.sehtakFee,this.serviceFee,this.services, this.type,
    this.specialization,
    this.appointment,
    this.doctor});

  factory BranchServices.fromJson({required Map<String, dynamic> json}){

    return BranchServices(
      id: json['id'],
      branch: json['branch'],
      sehtakFee:json['services'] ,
      serviceFee: json['service_fee'],
      services: json['sehtak_fee'],
        type: json['type'],
        specialization: json['Specialization'],
        appointment:
        AppointmentModel.fromJson(jsonList: json['appointments']),
      doctor: json['doctor']== null ? null: ClinicsResultItem.fromJson(json['doctor']),

    );
  }
}

class LabsServicesErrorResponse {

  String? message;

  LabsServicesErrorResponse({ this.message});
  factory LabsServicesErrorResponse.fromJson({required Map<String, dynamic> json}) {
    return LabsServicesErrorResponse(
      message: json['message'],
    );
  }
}
