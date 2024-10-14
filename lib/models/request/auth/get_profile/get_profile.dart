class GetProfileRequest{

  GetProfileUser? user;
  String?address;

  GetProfileRequest({this.user,this.address});

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "address": address,
  };
}

class GetProfileUser{
  int?id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? city;
  String? region;
  String? partnerType;



  GetProfileUser({this.firstName,this.id,this.lastName,this.email,this.partnerType,this.phone,this.city,this.region});

  Map<String, dynamic> toJson() => {

    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone': phone,
    'city': city,
    'region': region,
    'partner_type': partnerType,

  };

}