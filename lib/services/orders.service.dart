import 'package:flutter_workshop/models/order.model.ts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class OrderService {
  String url = 'http://192.168.216.2:3000/api/v1/orders';

  Future<List<OrderModel>> getOrders() async {
    var response = await http.get(url);
    if (response.statusCode == 200){
      return toList(response.body);
    }
  }

  Future<OrderModel> getOrderById(int orderId) async {
    var response = await http.get('$url/$orderId');
    if (response.statusCode == 200){
      return OrderModel.fromJson(convert.jsonDecode(response.body));
    }
  }

  List<OrderModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<OrderModel>((json) => OrderModel.fromJson(json)).toList();
  }
}