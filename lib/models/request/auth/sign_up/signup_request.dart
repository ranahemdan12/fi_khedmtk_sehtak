class SignUpRequestModel {
  UserModel? user;
  int? city;
  int? region;
  String?address;

  SignUpRequestModel({this.user, this.region, this.city,this.address});

  Map<String, dynamic> toJson() => {
        'user': user!.toJson(),
        'city': city,
        'region': region,
        'address': address,
      };
}

class UserModel {
  String? partnerType;
  String? firstName;
  String? lastName;

  String? email;
  String? phone;
  String? password;
  String? region;
  String? city;

  UserModel(
      {this.partnerType,
      this.firstName,
      this.email,
      this.phone,
      this.password,
      this.region,
      this.city,
      this.lastName});

  Map<String, dynamic> toJson() => {
        'partner_type': 'client',
        'first_name': firstName,
        // 'last_name': lastName,
        'phone': phone,
        "email": email,
        'password': password,
        // 'region': region,
        // 'city': city,
      };
}
