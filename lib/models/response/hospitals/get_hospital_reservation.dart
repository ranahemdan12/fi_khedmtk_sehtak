

class GetHospitalsReservationResponse {
  int? count;
  String? next;
  String? previous;
  ResultModel? result;

  GetHospitalsReservationResponse(
      {this.count, this.next, this.previous, this.result});

  factory GetHospitalsReservationResponse.fromJson(Map<String, dynamic> json) {
    return GetHospitalsReservationResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: ResultModel.fromJson(jsonList: json['results']),
    );
  }
}

class ResultModel {
  List<HospitalReservationItem> reservationResultItem;

  ResultModel({this.reservationResultItem = const []});

  factory ResultModel.fromJson({required List jsonList}) {
    return ResultModel(
        reservationResultItem:
        jsonList.map((e) => HospitalReservationItem.fromJson(e)).toList());
  }
}

class HospitalReservationItem {
  int? id;
  String? reservationStatus;
  int? client;
  int? branch;
  String? reservedAt;
  int? service;
  int? appointment;
  String? name;
  String? branchCity;
  String? branchRegion;
  double?sehtakFee;
  String? serviceName;

  HospitalReservationItem({
   this.id,this.service,this.branch,
    this.appointment,
    this.reservationStatus,
    this.client,
    this.reservedAt,
    this.serviceName,
    this.branchRegion,
    this.branchCity,
    this.sehtakFee,
    this.name
  });


  factory HospitalReservationItem.fromJson(Map<String, dynamic> jsonData) {
    return HospitalReservationItem(

      id: jsonData['id'],
      reservationStatus: jsonData['reservation_status'],
      client: jsonData['client'],
      branch: jsonData['branch'],
      service: jsonData['service'],
      reservedAt: jsonData['reserved_at'],
      name: jsonData['name'],
      branchCity: jsonData['branch_city'],
      branchRegion: jsonData['branch_region'],
      sehtakFee: jsonData['sehtak_fee'],
      serviceName: jsonData['service_name'],
      appointment: jsonData['appointment'],
    );
  }
}




class GetHospitalsReservationErrorResponse {
  String? message;

  GetHospitalsReservationErrorResponse({this.message});

  GetHospitalsReservationErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}