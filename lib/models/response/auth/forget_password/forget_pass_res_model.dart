class ForgetPasswordResModel {
  String? message;

  ForgetPasswordResModel({required this.message});

  factory ForgetPasswordResModel.fromJson(jsonData) {
    return ForgetPasswordResModel(
      message: jsonData['message'],
    );
  }
}
