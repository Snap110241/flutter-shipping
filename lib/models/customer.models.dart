class CustomerModel {
  int cusId;
  String cusName;
  String cusPhone;
  String cusLatitude;
  String cusLonggitude;

  CustomerModel({
    this.cusId,
    this.cusName,
    this.cusPhone,
    this.cusLatitude,
    this.cusLonggitude,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    try {
      return CustomerModel(
        cusId: json["cus_id"],
        cusName: json["cus_name"],
        cusPhone: json["cus_phone"],
        cusLatitude: json["cus_latitude"],
        cusLonggitude: json["cus_longgitude"],

      );
    }
    catch (ex) {
      print('Exception ====> Customer.formJson $ex');
      return CustomerModel();
    }
    }
  }

// int cus_id: number;
// String cus_name: string;
// String cus_phone: string;
// String cus_latitude: string;
// String cus_longgitude: string;
// List<Address> address_customers: AddressCustomers[]