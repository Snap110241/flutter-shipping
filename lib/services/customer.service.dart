import 'package:flutter_workshop/models/customer.models.dart';
import 'package:flutter_workshop/models/employee.models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class CustomerService {
  String url = 'http://192.168.216.2:3000/api/v1/customers';

  Future<List<CustomerModel>> getCustomer() async {
    var response = await http.get(url);
    if (response.statusCode == 200){
      return toList(response.body);
    }
  }
  List<CustomerModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CustomerModel>((json) => CustomerModel.fromJson(json)).toList();
  }
}