class GetDoctorReservationResponse {
  int? count;
  String? next;
  String? previous;
  DoctorReservationModel? result;

  GetDoctorReservationResponse({this.count, this.next, this.previous, this.result});

  factory GetDoctorReservationResponse.fromJson(Map<String, dynamic> json) {
    return GetDoctorReservationResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: DoctorReservationModel.fromJson(jsonList: json['results']),
    );
  }
}

class DoctorReservationModel {
  List<DoctorReservationItem> reservationItem;

  DoctorReservationModel({this.reservationItem = const []});

  factory DoctorReservationModel.fromJson({required List jsonList}) {
    return DoctorReservationModel(
        reservationItem:
            jsonList.map((e) => DoctorReservationItem.fromJson(e)).toList());
  }
}

class DoctorReservationItem {
  String? reservationStatus;
  int? id;
  int?user;
  int? client;
  String?doctorName;
  String?specialization;
  int?servorappId;
  List<String>subSpecialization;
  int? branch;
  String?clinicName;
  String?clinicCity;
  String?clinicRegion;
  String?reservedAt;
  double? sehtakFees;





  DoctorReservationItem({
    this.reservationStatus,this.user,this.branch,this.id,this.reservedAt,
    this.client,this.clinicName,this.clinicCity,this.clinicRegion,this.doctorName,this.sehtakFees,
    this.specialization,this.subSpecialization=const[],this.servorappId,
  });

  factory DoctorReservationItem.fromJson(Map<String, dynamic> jsonData) {
    return DoctorReservationItem(
      reservationStatus: jsonData['reservation_status'],
      id: jsonData['id'],
      client: jsonData['client'],
      user: jsonData['user'],
      doctorName: jsonData['doctor_name'],
      specialization: jsonData['specialization'],
      servorappId: jsonData['appointment'],
      subSpecialization:(jsonData['subspecialization'])!=null?(jsonData['subspecialization']as List).map( (e) => e.toString(), ).toList():[],
      branch: jsonData['branch'],
      clinicName: jsonData['clinic_name'],
      clinicCity: jsonData['clinic_city'],
      clinicRegion: jsonData['clinic_region'],
      reservedAt: jsonData['reserved_at'],
      sehtakFees: jsonData["sehtak_fees"],

    );
  }
}


class GetDoctorReservationErrorResponse {
  String? message;

  GetDoctorReservationErrorResponse({this.message});

  GetDoctorReservationErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
