class UserModel {
  int empId;
  String empUsername;
  String empPassword;
  String empName;
  String empPhone;
  String empEmail;


  UserModel(
    {this.empId,
      this.empUsername,
      this.empPassword,
      this.empName,
      this.empPhone,
      this.empEmail});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
        empId: json["emp_id"],
        empUsername: json["emp_username"],
        empPassword: json["emp_password"],
        empName: json["emp_mame"],
        empPhone: json["emp_phone"],
        empEmail: json["emp_email"],
      );
    } catch (ex) {
      print('Exception ====> UserModel.formJson $ex');
      return UserModel();
    }
  }
//

}