
class LoginErrorResponseModel {
  final String? message;

  LoginErrorResponseModel({
    this.message,
  });

  factory LoginErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginErrorResponseModel(
      message: json['message'],
    );
  }
}

class LoginSuccessResponseModel {
  DataModel data;

  LoginSuccessResponseModel({
    required this.data,
  });

  factory LoginSuccessResponseModel.fromJson(jsonData) {
    return LoginSuccessResponseModel(
      data: DataModel.fromJson(jsonData['data']),
    );
  }
}

class DataModel {
  String? message;
  String? phone;
  String? firstName;
  String? lastName;
  bool? isPatient;
  String? token;
  SerializerModel serializer;

  DataModel({
    this.phone,
    this.message,
    this.token,
    this.firstName,
    this.isPatient,
    this.lastName,
    required this.serializer,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      serializer: SerializerModel.fromJsom(json['serializer']),
      phone: json['phone'],
      message: json['message'],
      token: json['token'],
      firstName: json['first_name'],
      isPatient: json['is_patient'],
      lastName: json['last_name'],
    );
  }

}

class SerializerModel{

  UserModel user;
  String? points;
  String? wallet;
  SerializerModel({required this.user,this.wallet,this.points});
  factory SerializerModel.fromJsom(Map<String,dynamic>json){

    return SerializerModel(
      user: UserModel.fromJson(json['user']),
      points:json['points'] ,
      wallet: json['wallet'],
    );
  }



}
class UserModel{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  String? partnerType;

  UserModel({this.image,this.id,this.email,this.firstName,
    this.lastName,this.phone,this.partnerType});
   factory UserModel.fromJson(Map<String,dynamic>json){

     return UserModel(

       id:json['id'],
       firstName:json['first_name'],
       lastName:json['last_name'],
       email:json['email'],
       phone:json['phone'],
       image:json['image'],
       partnerType:json['partner_type'],




     );
   }



}