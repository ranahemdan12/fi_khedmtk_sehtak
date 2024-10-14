class ChangePhoneRequestModel{

  String? phone ;
  String? otp ;
  String? newPhone ;

  ChangePhoneRequestModel({this.phone,this.otp,this.newPhone});

  Map<String, dynamic> toJson() =>
      {
        'phone': phone,
        'otp':otp,
        'new_phone':newPhone,

      };

}