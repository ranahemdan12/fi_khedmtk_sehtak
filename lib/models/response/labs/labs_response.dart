import '../../../shared/statics/enum.dart';
import '../clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';

class LabsBranches {

  int? count;
  String? next;
  String? previous;
  List<LabsResultsItem>? results;
  double?minSehtakFees;
  double?maxSehtakFees;



  LabsBranches({
     this.count, this.next, this.previous, this.results, this.maxSehtakFees, this.minSehtakFees,
  });

  LabsBranches.fromJson(Map<String, dynamic> json,ServiceType service){
    count = json['count'];
    next = json['next'];
    previous =  json['previous'];
    results = List.from(json['results']).map((e)=>LabsResultsItem.fromJson(e,service)).toList();
    minSehtakFees= json['min_sehtak_fees'];
    maxSehtakFees= json['max_sehtak_fees'];

  }

}




class LabsResultsItem {
  int? id;
  Branch? branch;
  String? serviceFee;
  String? sehtakFee;
  AppointmentModel? appointmentModel;

  LabsResultsItem({this.id, this.branch, this.appointmentModel, this.serviceFee,
    this.sehtakFee,});



  LabsResultsItem.fromJson(Map<String, dynamic> json,ServiceType service){
    id = json['id'];
    branch = Branch.fromJson(json['branch'],service);
  appointmentModel=AppointmentModel.fromJson(jsonList: json['appointments']);
    serviceFee = json['service_fee'];
    sehtakFee = json['sehtak_fee'];
  }

}

class Branch {
  Branch({
    this.id,
    this.user,
    this.city,
    this.region,
    this.latitude,
    this.longitude
  });
  int? id;
  User? user;
  String? city;
  String? region;
  double? latitude;
  double? longitude;


  Branch.fromJson(Map<String, dynamic> json,ServiceType service){
    id = json['id'];
    // user =service==ServiceType.lab?User.fromJson(json['lab']):User.fromJson(json['scan']);
    user=User.fromJson(json['user'], service);
    city = json['city'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

}



class User {
  User({
    this.firstName, this.image,
  });
  String? firstName;
  String? image;

  User.fromJson(Map<String, dynamic> json,ServiceType service){
    firstName = json['first_name'];
    image = json['image'];
  }

}

class LabsErrorResponse{
  final String? message;
  LabsErrorResponse({this.message});
  factory LabsErrorResponse.fromJson({required Map<String,dynamic> json}){
    return LabsErrorResponse(message: json['message']);
  }
}