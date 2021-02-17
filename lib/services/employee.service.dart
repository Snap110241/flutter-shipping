import 'package:flutter_workshop/models/employee.models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class EmployeeService {
  String url = 'http://192.168.216.2:3000/api/v1/employees';

  Future<List<EmployeeModel>> getUsers() async {
    var response = await http.get(url);
    if (response.statusCode == 200){
      return toList(response.body);
    }
  }
  List<EmployeeModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<EmployeeModel>((json) => EmployeeModel.fromJson(json)).toList();
  }
}