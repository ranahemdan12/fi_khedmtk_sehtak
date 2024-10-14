class GetNotificationResponse{

  int? count;
  String? next;
  String? previous;
  ResultModel? result;

  GetNotificationResponse({ this.count, this.next, this.previous, this.result});

  factory GetNotificationResponse.fromJson(Map<String,dynamic>json){

    return GetNotificationResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      result: ResultModel.fromJson(jsonList: json['results']),
    );
  }
}
class ResultModel {
  List<NotificationResultItem> resultItem;

  ResultModel({this.resultItem = const []});

  factory ResultModel.fromJson({required List jsonList}) {
    return ResultModel(
        resultItem: jsonList.map((e) => NotificationResultItem.fromJson(e)).toList());
  }
}
class NotificationResultItem {
  int?id;
  String? type;
  String? createdAt;
  String? message;
  int?user;

  NotificationResultItem({
   this.id,this.message,this.type,this.user,this.createdAt});

  factory NotificationResultItem.fromJson(Map<String, dynamic> jsonData) {
    return NotificationResultItem(
     id: jsonData['id'],
      message: jsonData['message'],
      createdAt: jsonData['created_at'],
      type: jsonData['type'],
      user: jsonData['user'],




    );
  }
}

class GetNotificationErrorResponse{

  String?message;

  GetNotificationErrorResponse({ this.message});

  factory GetNotificationErrorResponse.fromJson(Map<String,dynamic>json){

    return GetNotificationErrorResponse(
        message: json['message']
    );
  }
}