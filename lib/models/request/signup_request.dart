class SignUpRequestModel{
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? city;

  SignUpRequestModel({this.firstName, this.lastName, this.email,
    this.phoneNumber, this.password,
  this.city,});

  Map<String, dynamic> toJson() =>
      {
        'first_name': firstName,
        'last_name':lastName ,
        "email":email,
        'phone':phoneNumber,
        'password': password,
       " city": city,
      };
}