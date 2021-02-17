class DeliveryDetailModel {
  int deldeId;
  int deldeProPrice;
  String deldeProName;
  String deldeProType;
  String deldeProUnit;
  String deldeProQty;


  DeliveryDetailModel({this.deldeId, this.deldeProPrice, this.deldeProName,
      this.deldeProType, this.deldeProUnit, this.deldeProQty});

  factory DeliveryDetailModel.fromJson(Map<String, dynamic> json) {
    return DeliveryDetailModel(
      deldeId: int.parse(json["delde_id"].toString()),
      deldeProPrice: int.parse(json["delde_pro_price"].toString()),
      deldeProName: json["delde_pro_name"],
      deldeProType: json["delde_pro_type"],
      deldeProUnit: json["delde_pro_unit"],
      deldeProQty: json["delde_pro_qty"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "delde_id": this.deldeId,
      "delde_pro_price": this.deldeProPrice,
      "delde_pro_name": this.deldeProName,
      "delde_pro_type": this.deldeProType,
      "delde_pro_unit": this.deldeProUnit,
      "delde_pro_qty": this.deldeProQty,
    };
  }

//

}