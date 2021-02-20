import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/location.dart';
import 'package:flutter_workshop/models/delivery.model.dart';
import 'package:flutter_workshop/services/delivery.service.dart';
import 'package:flutter_workshop/services/orders.service.dart';
import 'package:flutter_workshop/untilites/radio.model.dart';
import 'models/delivery_detail.model.dart';
import 'models/order.model.ts.dart';

class DeliveryDetail extends StatefulWidget {
  int delId;

  DeliveryDetail(this.delId);

  @override
  _DeliveryDetailState createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  List<RadioModel> _radioItem = new List<RadioModel>();
  final List<String> _deliveryStatus = ['ส่งแล้ว', 'ค้างส่ง', 'กำลังส่ง'];
  int _selectedDeliveryStatus;
  DeliveryModel _deilivery;

  @override
  void initState() {
    super.initState();
    this._deliveryStatus.asMap().forEach((index, value) {
      this._radioItem.add(new RadioModel(false, index, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_DeliveryDetailState ====> ${this.widget.delId}');

    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดคิวส่งสินค้า'),
      ),
      body: FutureBuilder(
          future: DeliveryService().getDeliveryById(this.widget.delId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              this._deilivery = snapshot.data;
              // return DefaultTextStyle(
              //   style: Theme
              //       .of(context)
              //       .textTheme
              //       .bodyText2,
              //   child: LayoutBuilder(
              //     builder: (BuildContext context, BoxConstraints viewportConstraints) {
              //       return SingleChildScrollView(
              //         child: ConstrainedBox(
              //             constraints: BoxConstraints(
              //               minHeight: viewportConstraints.maxHeight,
              //             ),
              //             child: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: <Widget>[
              //                 Container(
              //                   color: const Color(0xffeeee00), // Yellow
              //                   height: 50,
              //                   alignment: Alignment.centerLeft,
              //                   child: Row(
              //                     crossAxisAlignment: CrossAxisAlignment.stretch,
              //                     children: [
              //                       Expanded(
              //                         flex: 1,
              //                         child: Text('ชื่อลูกค้า'),
              //                       ),
              //                       Expanded(
              //                         flex: 3,
              //                         child: Text(deilivery.delCusName),
              //                       ),
              //
              //                     ],
              //                   ),
              //
              //                 ),
              //                 Container(
              //                   color: Colors.cyan,
              //                   height: 70,
              //                   alignment: Alignment.centerLeft,
              //                   child: Row(
              //                     crossAxisAlignment: CrossAxisAlignment.stretch,
              //                     children: [
              //                       Expanded(
              //                         flex: 1,
              //                         child: Text('ที่อยู่ลูกค้า'),
              //                       ),
              //                       Expanded(
              //                         flex: 3,
              //                         child: Text(deilivery.delCusAdderss),
              //                       ),
              //                     ],
              //                   ),
              //
              //                 ),
              //                 Container(
              //                   // Another fixed-height child.
              //
              //                   color: const Color(0xff008000), // Green
              //                   alignment: Alignment.topCenter,
              //                   child: Row(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: <Widget>[
              //                       Expanded(
              //                         flex: 6, // 20%
              //                         child: Container(
              //                           color: Colors.red,
              //                           child: const Text('สินค้า'),
              //                         ),
              //
              //                       ),
              //                       Expanded(
              //                         flex: 2, // 60%
              //                         child: Container(
              //                           color: Colors.green,
              //                           child: const Text('จำนวน'),
              //                         ),
              //                       ),
              //                       Expanded(
              //                         flex: 2, // 20%
              //                         child: Container(
              //                           color: Colors.blue,
              //                           child: const Text('ราคา'),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //                 this._buildDeliveryItem(deilivery.deliveryDetail),
              //                 Container(
              //                   height: 30,
              //                   alignment: Alignment.topRight,
              //                   child: Row(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       // RaisedButton(
              //                       //     child: Text('Map'),
              //                       //     onPressed: () =>
              //                       //         Navigator.push(
              //                       //             context,
              //                       //             MaterialPageRoute(
              //                       //                 builder: (context) => Map())
              //                       //         )
              //                       // ),
              //
              //                       RaisedButton(
              //                           child: Text('ส่งสำเร็จ'),
              //                           elevation: 6.0,
              //                           onPressed: () =>
              //                           {
              //                             Shipcom(context),
              //                           }
              //                       ),
              //                       RaisedButton(
              //                           child: Text('ค้างส่ง'),
              //                           elevation: 6.0,
              //                           onPressed: () =>
              //                           {
              //                             backlog(context),
              //                           }
              //                       ),
              //                       Expanded(
              //                         flex: 2,
              //                         child: Text('ราคารวม'),
              //                       ),
              //                     ],
              //                   ),
              //
              //                 )
              //               ],
              //
              //             )
              //
              //         ),
              //
              //       );
              //     },
              //   ),
              // );
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  this._buildCustomerName(this._deilivery.delCusName),
                  this._buildCustomerAddress(this._deilivery.delCusAdderss),
                  this._buildDeliveryStatus(this._deilivery.delStatus),
                  this._buildHeaderTable(),
                  this._buildDeliveryItem(this._deilivery.deliveryDetail),
                  this._buildButtomMap(),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  void Shipcom(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('ส่งสำเร็จ'),
      content: Text('ยืนยันการทำรายการ'),
      actions: [
        FlatButton(
          child: Text('ยกเลิก'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('ตกลง'),
          onPressed: () {},
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void backlog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('ค้างส่ง'),
      content: Text('เปลี่ยนสถานะเป็นค้างส่ง?'),
      actions: [
        FlatButton(
          child: Text('ยกเลิก'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('ตกลง'),
          onPressed: () {},
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Widget _buildCustomerName(String customerName) {
    return Row(
      children: [
        Text('customer name'),
        SizedBox(
          width: 10,
        ),
        Text(customerName)
      ],
    );
  }

  Widget _buildCustomerAddress(String customerAddress) {
    return Row(
      children: [
        Text('customer address'),
        SizedBox(
          width: 10,
        ),
        Text(customerAddress)
      ],
    );
  }

  Widget _buildDeliveryStatus(int deliveryStatus) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Status'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: List.generate(
                this._deliveryStatus.length,
                (index) => this._buildRadioListTile(index),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioListTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
            color: this._selectedDeliveryStatus == (index + 1)
                ? Colors.blue
                : Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: RadioListTile<int>(
        activeColor: Colors.blue,
        title: Text(this._deliveryStatus[index]),
        value: index + 1,
        groupValue: this._selectedDeliveryStatus,
        onChanged: (int value) {
          print(value);
          this._deilivery.delStatus = value;
          // DeliveryModel updateDelivery = DeliveryModel();
          // updateDelivery.delStatus = value;
          DeliveryService()
              .updateDelivery(this.widget.delId, this._deilivery)
              .then((response) {
            setState(() {
              print('results ${response.body}');
              this._selectedDeliveryStatus = value;
            });
          });
        },
      ),
    );
  }

  Widget _buildHeaderTable() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(children: [
        Row(
          children: <Widget>[
            Expanded(
              flex: 6, // 20%
              child: Container(
                color: Colors.white30,
                child: Text('ชื่อสินค้า'),
              ),
            ),
            Expanded(
              flex: 2, // 60%
              child: Container(
                color: Colors.white38,
                child: Text('จำนวน'),
              ),
            ),
            Expanded(
              flex: 2, // 20%
              child: Container(
                color: Colors.white54,
                child: Text('ราคา'),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Widget _buildDeliveryItem(List<DeliveryDetailModel> deliveries) {
    return Column(
      children: List.generate(
        deliveries.length,
        (index) => Row(
          children: <Widget>[
            Expanded(
              flex: 6, // 20%
              child: Container(
                color: Colors.white54,
                child: Text(deliveries[index].deldeProName),
              ),
            ),
            Expanded(
              flex: 2, // 60%
              child: Container(
                color: Colors.white54,
                child: Text(deliveries[index].deldeProQty),
              ),
            ),
            Expanded(
              flex: 2, // 20%
              child: Container(
                color: Colors.white54,
                child: Text(deliveries[index].deldeProPrice.toString()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtomMap() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        RaisedButton(
            child: Text('Map'),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Location()),
                ))
      ]),
    );
  }
}
