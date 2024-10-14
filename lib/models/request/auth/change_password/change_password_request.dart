class ChangePasswordRequest{


  String? oldPassword ;
  String? newPassword ;
  String? confirmPassword ;

  ChangePasswordRequest({this.confirmPassword,this.newPassword,this.oldPassword});

  Map<String, dynamic> toJson() =>
      {
        'old_password': oldPassword,
        'new_password':newPassword,
        'confirm_password':confirmPassword,

      };

}