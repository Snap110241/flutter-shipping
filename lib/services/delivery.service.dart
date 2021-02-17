import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/delivery.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DeliveryService {
  String url = 'http://192.168.216.2:3000/api/v1/deilverys';
  static const className = 'DeliveryService';

  Future<List<DeliveryModel>> getDeliverys() async {
    var response = await http.get(url);

    if (response.statusCode == 200){
      return toList(response.body);
    }
  }

  Future<DeliveryModel> getDeliveryById(int delId) async {
    var response = await http.get('$url/$delId');
    if (response.statusCode == 200){
      return DeliveryModel.fromJson(convert.jsonDecode(response.body));
    }
  }

  Future<http.Response> createDelivery(DeliveryModel model) async {
    try {
      return await http.post(url,
          body: convert.jsonEncode(model.toJson()));
    } catch(e) {
      print("$className createDelivery(DeliveryModel model) failed with status ${e.toString()}");
    }
  }

  Future<http.Response> updateDelivery(int id, DeliveryModel model) async {
    try {
      print('update ${model.toJson()}');
      return await http.put('$url/$id',
          body: convert.jsonEncode(model.toJson()));
    } catch(e) {
      print("$className  updateDelivery(String id, DeliveryModel model) failed with status ${e.toString()}");
    }
  }

  List<DeliveryModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<DeliveryModel>((json) => DeliveryModel.fromJson(json)).toList();
  }
}