class GetCartItemsResponse{

  double? total;

  ItemsModel? result;

  GetCartItemsResponse({this.total, this.result,});
  factory GetCartItemsResponse.fromJson(Map<String,dynamic>json){
    return GetCartItemsResponse(

      total: json['total'],
      result: ItemsModel.fromJson(jsonList: json['items']),
    );
  }
}

class ItemsModel {
  List<Items> resultItem;

  ItemsModel({this.resultItem = const []});

  factory ItemsModel.fromJson({required List jsonList}) {
    return ItemsModel(
        resultItem: jsonList.map((e) => Items.fromJson(e)).toList());
  }
}

class Items {
  int? itemId;
  int?service;
  String? serviceName;
  String? serviceType;
  double? servicePrice;
  int? cart;
  int? branch;

  Items({this.cart,this.serviceName,this.serviceType,this.service,this.branch,this.itemId,this.servicePrice});

  factory Items.fromJson(Map<String, dynamic> jsonData) {
    return Items(
        itemId: jsonData['item_id'],
        service : jsonData['service'],
        serviceName : jsonData['service_name'],
        serviceType:  jsonData['service_type'],
        servicePrice:  jsonData['service_price'],
         cart:  jsonData['cart'],
      branch:  jsonData['branch'],


    );
  }
}


class GetCartItemsErrorResponse{
  String? message;

  GetCartItemsErrorResponse({this.message});

  GetCartItemsErrorResponse.fromJson(Map<String, dynamic> json){
    message= json['detail'];
  }
}