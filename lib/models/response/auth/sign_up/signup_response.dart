class SignUpSuccessResponseModel {
  DataModel data;

  SignUpSuccessResponseModel({required this.data});

  factory SignUpSuccessResponseModel.fromJson(jsonData) {
    return SignUpSuccessResponseModel(
      data: DataModel.fromJson(jsonData['data']),
    );
  }
}

class DataModel {
  String? message;
  int? id;

  DataModel({this.message, this.id});

  factory DataModel.fromJson(jsonData) {
    return DataModel(
      message: jsonData['message'],
      id: jsonData['id'],
    );
  }
}

class SignUpErrorResponseModel {
  final String? message;

  SignUpErrorResponseModel({
    this.message,
  });

  factory SignUpErrorResponseModel.fromJson(jsonData) {
    return SignUpErrorResponseModel(
      message: jsonData['message'],
    );
  }
}
