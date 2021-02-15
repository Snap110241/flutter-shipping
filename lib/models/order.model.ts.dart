
class OrderModel {
  int orderId;
  int ordStatus;
  int ordTotal;
  String ordDate;
  String ordEmpName;
  String ordEmpPhone;
  String ordEmpEmail;
  String ordNote;
  String ordCusName;
  String ordCusPhone;
  String ordCusAddress;
  int ordDiscount;

  OrderModel({
    this.orderId,
    this.ordStatus,
    this.ordTotal,
    this.ordDate,
    this.ordEmpName,
    this.ordEmpPhone,
    this.ordEmpEmail,
    this.ordNote,
    this.ordCusName,
    this.ordCusPhone,
    this.ordCusAddress,
    this.ordDiscount
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    try {
      return OrderModel(
        orderId: json["order_id"],
        ordStatus: json["ord_status"],
        ordTotal: json["ord_total"],
        ordDate: json["ord_date"],
        ordEmpName: json["ord_emp_name"],
        ordEmpPhone: json["ord_emp_phone"],
        ordEmpEmail: json["ord_emp_email"],
        ordNote: json["ord_note"],
        ordCusName: json["ord_cus_name"],
        ordCusPhone: json["ord_cus_phone"],
        ordCusAddress: json["ord_cus_address"],
        ordDiscount: json["ord_discount"],
      );
    }
    catch (ex) {
      print('Exception ====> OrderModel.formJson $ex');
      return OrderModel();
    }
    }
  }
