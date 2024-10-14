import 'dart:core';

import '../clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';

class GetPackageResponse {
  int? count;
  String? next;
  String? previous;
  ResultModel? result;

  GetPackageResponse({this.next, this.count, this.result, this.previous});

  factory GetPackageResponse.fromJson(Map<String, dynamic> json) {
    return GetPackageResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: ResultModel.fromJson(jsonList: json['results']),
    );
  }
}

class ResultModel {
  List<PackageItem> resultItem;

  ResultModel({this.resultItem = const []});

  factory ResultModel.fromJson({required List jsonList}) {
    return ResultModel(
        resultItem: jsonList.map((e) => PackageItem.fromJson(e)).toList());
  }
}

class PackageItem {
  int? id;
  int? branch;
  String? services;
  String? sehtakFee;
  String? serviceFee;
  AppointmentModel? appointment;
  String? type;
  int? specialization;
  ClinicsResultItem? doctor;

  PackageItem(
      {this.id,
      this.services,
      this.branch,
      this.sehtakFee,
      this.serviceFee,
      this.type,
      this.specialization,
      this.appointment,
      this.doctor});
  factory PackageItem.fromJson(Map<String, dynamic> jsonData) {

    return PackageItem(
      id: jsonData['id'],
      branch: jsonData['branch'],
      services: jsonData['services'],
      serviceFee: jsonData['service_fee'],
      sehtakFee: jsonData['sehtak_fee'],
      type: jsonData['type'],
      specialization: jsonData['Specialization'],
      appointment:
          AppointmentModel.fromJson(jsonList: jsonData['appointments']
          ),
      doctor: jsonData['doctor']== null ? null: ClinicsResultItem.fromJson(jsonData['doctor']),
    );
  }
}

class GetPackageErrorResponse {
  String? message;

  GetPackageErrorResponse({this.message});

  GetPackageErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
