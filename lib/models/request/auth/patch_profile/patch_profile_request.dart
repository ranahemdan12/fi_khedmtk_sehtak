class PatchProfileRequest {
  PatchUser? user;

  PatchProfileRequest({this.user});

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class PatchUser {
  String? firstName;


  PatchUser({this.firstName});

  Map<String, dynamic> toJson() => {
        'first_name': firstName,

      };
}
