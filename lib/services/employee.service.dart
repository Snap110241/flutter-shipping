import 'package:flutter_workshop/models/employee.models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../params_options.dart';
class EmployeeService {
  String url = 'http://192.168.216.2:3000/api/v1/employees';

  static const className = 'EmployeeService';

  Future<List<EmployeeModel>> getUsers() async {
    var response = await http.get(url);
    if (response.statusCode == 200){
      return toList(response.body);
    }
  }
  Future<EmployeeModel> getEmployeeById(int empId) async {
    var response = await http.get('$url/$empId');
    if (response.statusCode == 200){
      return EmployeeModel.fromJson(convert.jsonDecode(response.body));
    }
  }
  Future  getSetupLocations(ParamsOption params) async {
    if(params != null) {
      url = '$url${params.toParams(params.toJson())}';
    }
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map map = {
        'data' : toList(response.body),
        'total': convert.jsonDecode(response.body)['total']
      };
      return map;
    } else{
      print(
          "$className getSetupLocations(ParamsOption options) failed with status ${response.statusCode}. ${response.body.toString()}");
    }
  }
  Future getLocationById(String id) async {
    // if(params != null) {
    //   url = '$url${params.toParams(params.toJson())}';
    // }
    // print('my id =====> $id');

    url = '$url/$id';
    // print('======>    $url');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return EmployeeModel.fromJson(convert.jsonDecode(response.body));
    } else{
      print(
          "$className getLocationById(String id) failed with status ${response.statusCode}. ${response.body.toString()}");
    }
  }

  List<EmployeeModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<EmployeeModel>((json) => EmployeeModel.fromJson(json)).toList();
  }
}