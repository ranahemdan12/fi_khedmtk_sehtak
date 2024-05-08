class LoginRequestModel {
  String? phoneNumber;
  String? password;

  LoginRequestModel({this.phoneNumber, this.password});

  Map<String, dynamic> toJson() => {'password': password,"email": phoneNumber};
}