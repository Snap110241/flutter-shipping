
import 'package:flutter_workshop/delivery_detail..dart';
import 'dart:convert' as convert;
import 'delivery_detail.model.dart';

class DeliveryModel {
  int delId;
  int delStatus;
  String delDate;
  String delEmpName;
  String delEmpPhone;
  int delOrdStatus;
  String delCusAdderss;
  int delOrdTotel;
  String delOrdDate;
  String delCusName;
  String delCusPhone;
  String delOrddeNote;
  String deldeCusLatitude;
  String deldeCusLonggitude;
  List<DeliveryDetailModel> deliveryDetail;

  DeliveryModel({
    this.delId,
    this.delStatus,
    this.delDate,
    this.delEmpName,
    this.delEmpPhone,
    this.delOrdStatus,
    this.delCusAdderss,
    this.delOrdTotel,
    this.delOrdDate,
    this.delCusName,
    this.delCusPhone,
    this.delOrddeNote,
    this.deldeCusLatitude,
    this.deldeCusLonggitude,
    this.deliveryDetail
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    try {
      var deliveryDetailList = json['deilvery_detail'] as List;

      return DeliveryModel(
        delId: int.parse(json["del_id"].toString()),
        delStatus: int.parse(json["del_status"].toString()),
        delDate: json["del_date"],
        delEmpName: json["del_emp_name"],
        delEmpPhone: json["del_emp_phone"],
        delOrdStatus: int.parse(json["del_ord_status"].toString()),
        delCusAdderss: json["del_cus_adderss"],
        delOrdTotel: int.parse(json["del_ord_totel"].toString()),
        delOrdDate: json["del_ord_date"],
        delCusName: json["del_cus_name"],
        delCusPhone: json["del_cus_phone"],
        delOrddeNote: json["del_ordde_note"],
        deldeCusLatitude: json["delde_cus_latitude"],
        deldeCusLonggitude: json["delde_cus_longgitude"],
        deliveryDetail: deliveryDetailList.map((element) => DeliveryDetailModel.fromJson(element)).toList()
      );
    }
    catch (ex) {
      print('Exception ====> DeliveryModel.formJson $ex');
      return DeliveryModel();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "del_status": this.delStatus,
      "del_date": this.delDate,
      "del_emp_name": this.delEmpName,
      "del_emp_phone": this.delEmpPhone,
      "del_ord_status": this.delOrdStatus,
      "del_cus_adderss": this.delCusAdderss,
      "del_ord_totel": this.delOrdTotel,
      "del_ord_date": this.delOrdDate,
      "del_cus_name": this.delCusName,
      "del_cus_phone": this.delCusPhone,
      "del_ordde_note": this.delOrddeNote,
      "delde_cus_latitude": this.deldeCusLatitude,
      "delde_cus_longgitude": this.deldeCusLonggitude,
      "delivery_detail": convert.jsonEncode(this.deliveryDetail),
    };
  }
}
