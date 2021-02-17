class EmployeeModel {
  int empId;
  String empUsername;
  String empPassword;
  String empName;
  String empPhone;
  String empEmail;


  EmployeeModel(
      {this.empId,
        this.empUsername,
        this.empPassword,
        this.empName,
        this.empPhone,
        this.empEmail});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    try {
      return EmployeeModel(
        empId: json["emp_id"],
        empUsername: json["emp_username"],
        empPassword: json["emp_password"],
        empName: json["emp_mame"],
        empPhone: json["emp_phone"],
        empEmail: json["emp_email"],
      );
    } catch (ex) {
      print('Exception ====> UserModel.formJson $ex');
      return EmployeeModel();
    }
  }
//

}