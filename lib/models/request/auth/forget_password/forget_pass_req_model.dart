class ForgetPasswordReqModel {


  String?phone ;



  ForgetPasswordReqModel ({this.phone});

  Map<String, dynamic> toJson() =>
      {
        'phone': phone,


      };

}