class ProfileSuccessResponseModel {

  UserDetails? info;
  String?address;


  ProfileSuccessResponseModel({ this.info,this.address });

  factory ProfileSuccessResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ProfileSuccessResponseModel(
      address: json['address'],
      info: UserDetails.fromJson(json['user']),
    );
  }
}

class UserDetails{
  int?id;
  String?firstName;
  String?lastName;
  String?email;
  String?phone;
  String?image;
  String?partnerType;
  UserDetails({this.partnerType,this.id,this.firstName,this.image,this.lastName,this.email,this.phone});

factory UserDetails.fromJson(Map<String,dynamic>json){
  return UserDetails(
     id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    email: json['email'],
    phone: json['phone'],
    image: json['image'],
    partnerType: json['partner_type'],


  );
  }

}

class ProfileErrorResponse {
  String? message;

  ProfileErrorResponse({this.message});

  ProfileErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
