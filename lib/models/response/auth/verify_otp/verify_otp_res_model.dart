class VerifyOtpResponseModel {
  String? message;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? active;
  bool? verified;
  String? token;
  int? status;

  VerifyOtpResponseModel({
    required this.message,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.active,
    required this.verified,
    required this.token,
    required this.status,
  });

  factory VerifyOtpResponseModel.fromJson(jsonData) {
    return VerifyOtpResponseModel(
      message: jsonData['message'],
      id: jsonData['id'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      active: jsonData['active'],
      verified: jsonData['verified'],
      token: jsonData['token'],
      status: jsonData['status'],
    );
  }
}

class VerifyOtpErrorResponseModel {
  String? message;

  VerifyOtpErrorResponseModel({required this.message});

  factory VerifyOtpErrorResponseModel.fromJson(jsonData) {
    return VerifyOtpErrorResponseModel(
      message: jsonData['message'],
    );
  }
}
