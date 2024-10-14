class ResetPassRequestModel{
  String?phone ;
  String? otp;
  String? password;


  ResetPassRequestModel ({this.phone,this.otp,this.password});

  Map<String, dynamic> toJson() =>
      {
        'phone': phone,
        'otp':otp,
        'password':password,

      };
  }



