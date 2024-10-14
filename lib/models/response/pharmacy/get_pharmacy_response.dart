




class GetPharmacyResponse{

  List<GetPharmacyItem> resultItem;

  GetPharmacyResponse({this.resultItem = const []});

  factory GetPharmacyResponse.fromJson({required List jsonList}) {
    return GetPharmacyResponse(
        resultItem: jsonList.map((e) => GetPharmacyItem.fromJson(e)).toList());
  }

}




class GetPharmacyItem{
  UserModel? user;
  String? address;
  String? pharmacyName;
  int? city;
  int? region;


  GetPharmacyItem({this.address,this.pharmacyName,this.region,this.city,this.user});

  factory GetPharmacyItem.fromJson(Map<String,dynamic>json){

    return GetPharmacyItem(

      user: UserModel.fromJson(json['user']),
      address: json['address'],
      pharmacyName: json['pharmacy_name'],
      city: json['city'],
      region: json['region'],


    );
  }

}


class UserModel
{
  String? firstName;
  String? image;
  UserModel({this.firstName,this.image});
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      firstName: json['first_name'],
      image: json['image'],
    );
  }

}




class GetPharmacyErrorResponse{
  String? message;

  GetPharmacyErrorResponse({required this.message});
  factory GetPharmacyErrorResponse.fromJson( Map<String,dynamic> json){
    return GetPharmacyErrorResponse(
        message: json['message']
    );
  }
}