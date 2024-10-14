import '../../../shared/statics/enum.dart';

class ReserveLabServiceSuccessResponse {
  int? id;
  String? reservationStatus;
  int? client;
  int? branch;
  int? service;
  int? appointment;
  String? reservedAt;
  String? labName;
  String? branchCity;
  String? branchRegion;
  String? serviceName;
  double? sehtakFee;

  ReserveLabServiceSuccessResponse(
      {this.id,
      this.reservationStatus,
      this.branch,
      this.client,
      this.reservedAt,
      this.branchCity,
      this.branchRegion,
      this.labName,
      this.serviceName,
      this.service,
      this.sehtakFee,
      this.appointment});

  factory ReserveLabServiceSuccessResponse.fromJson(
      Map<String, dynamic> json, ServiceType service) {
    return ReserveLabServiceSuccessResponse(
      id: json['id'],
      service: json['service'],
      reservationStatus: json['reservation_status'],
      client: json['client'],
      appointment: json['appointment'],
      branch: json['branch'],
      reservedAt: json['reserved_at'],
      labName: service == ServiceType.lab ? json['lab_name'] : json['lab_name'],
      branchCity: json['branch_city'],
      branchRegion: json['branch_region'],
      serviceName: json['service_name'],
      sehtakFee: json['sehtak_fee'],
    );
  }
}

class ReserveLabServiceErrorResponse {
  final String? message;

  ReserveLabServiceErrorResponse({required this.message});

  factory ReserveLabServiceErrorResponse.fromJson(
      {required Map<String, dynamic> json}) {
    return ReserveLabServiceErrorResponse(message: json['message']);
  }
}
