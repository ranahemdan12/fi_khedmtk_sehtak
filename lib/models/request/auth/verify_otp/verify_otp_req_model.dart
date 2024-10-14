class VerifyOtpRequestModel {
  String? phone;
  String? otp;
  String? action;

  VerifyOtpRequestModel({this.phone, this.otp, this.action});

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'otp': otp,
        'action': action,
      };
}
