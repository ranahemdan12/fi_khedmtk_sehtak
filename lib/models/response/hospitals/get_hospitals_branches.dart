
class  GetHospitalsBranchesResponse{
  int? count;
  String? next;
  String? previous;
  HospitalResultModel? result;

  GetHospitalsBranchesResponse(
      {this.count, this.next, this.previous, this.result});

  factory GetHospitalsBranchesResponse.fromJson(Map<String, dynamic> json) {
    return GetHospitalsBranchesResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: HospitalResultModel.fromJson(jsonList: json['results']),
    );
  }


}

class HospitalResultModel {
  List<HospitalResultItem> hospitalResultItem;

  HospitalResultModel({this.hospitalResultItem = const []});

  factory HospitalResultModel.fromJson({required List jsonList}) {
    return HospitalResultModel(
        hospitalResultItem: jsonList.map((e) => HospitalResultItem.fromJson(e)).toList());
  }
}


class HospitalResultItem{

  int? id;
  HospitalModel?hospital;
  String? city;
  String? region;
  double? latitude;
  double? longitude;
  // int? user;

  HospitalResultItem({this.id,this.hospital,this.city,this.region,this.longitude,
    this.latitude,
  // this.user
  });
  
  factory  HospitalResultItem.fromJson(Map<String,dynamic>jsonData){
     return HospitalResultItem(
       
       id: jsonData['id'],
       hospital:jsonData['hospital']==null?null:HospitalModel.fromJson(jsonData['hospital']) ,
       city:jsonData['city'] ,
       region:jsonData['region'] ,
       latitude:jsonData['latitude'] ,
       longitude:jsonData['longitude'] ,
       // user:jsonData['user'] ,


       
       
     );
  }

}


class HospitalModel{
  int? id;
  HospitalUserModel? user;
  bool?clinic;
  bool?scans;
  bool?lab;
  bool?operations;

  HospitalModel({this.id,this.user,this.clinic,this.operations,this.lab,this.scans});

factory HospitalModel.fromJson(Map<String,dynamic>jsonData){
 return  HospitalModel(
   id: jsonData['id'],
   user: HospitalUserModel.fromJson(jsonData['user']),
   clinic:jsonData['clinic'] ,
   scans:jsonData['scans'] ,
   lab:jsonData['lab'] ,
   operations:jsonData['operations'] ,
 );
}}


class HospitalUserModel{
  String?firstName;
  String?image;

  HospitalUserModel({this.firstName,this.image});
  factory HospitalUserModel.fromJson(Map<String, dynamic> jsonData) {
    return HospitalUserModel(
      firstName: jsonData['first_name'],
      image: jsonData['image'],
    );}


}

class GetHospitalsBranchesErrorResponse {
  String? message;

  GetHospitalsBranchesErrorResponse({this.message});

  GetHospitalsBranchesErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}