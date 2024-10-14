class ChangePhoneResponse {}








class ChangePhoneResponseError {
  String? message;

  ChangePhoneResponseError({required this.message});

  ChangePhoneResponseError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
