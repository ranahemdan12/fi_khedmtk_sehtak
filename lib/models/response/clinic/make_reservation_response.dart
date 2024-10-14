class MakeReservationResponse{

  String? payMobUrl;
  bool? isPaid;
  String?message;

  MakeReservationResponse({this.payMobUrl,this.isPaid,this.message});

  MakeReservationResponse.fromJson(Map<String,dynamic>json, ){
    isPaid = json.containsKey('paymob_url')? false:true;
    payMobUrl=json['paymob_url'];
    message=json['message'];
  }
}



class MakeReservationErrorResponse{
  String? message;

  MakeReservationErrorResponse({this.message});

  MakeReservationErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['detail'];
  }
}