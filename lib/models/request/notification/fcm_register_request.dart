class FcmRegisterRequest{
  String?registerId;


  FcmRegisterRequest({this.registerId});
  Map<String,dynamic> toJson()=> {

    'registration_id':registerId,
  };
}