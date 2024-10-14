class RestPassResponseModel{


  String? message;
  RestPassResponseModel({required this.message});

  factory RestPassResponseModel.fromJson(jsonData){

    return RestPassResponseModel(
      message: jsonData['message'],
    );
  }

}