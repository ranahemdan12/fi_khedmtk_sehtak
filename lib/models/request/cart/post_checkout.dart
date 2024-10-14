class PostCheckOutRequest{

  String? payment;

  PostCheckOutRequest({this.payment });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    payment?.isNotEmpty == true
        ? map.addAll({'payment': payment})
        : {};

    return map;
  }


}