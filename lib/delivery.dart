import 'package:flutter/material.dart';
import 'package:flutter_workshop/delivery_detail..dart';
import 'package:flutter_workshop/models/delivery.model.dart';
import 'package:flutter_workshop/services/delivery.service.dart';

import 'models/order.model.ts.dart';
import 'services/orders.service.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('คิวส่งสินค้า'),
        ),
        body: FutureBuilder(
          future: DeliveryService().getDeliverys(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<DeliveryModel> deliverys = snapshot.data;
              //
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  deliverys.length,
                  (int index) => SizedBox(
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        print(deliverys[index].delId);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DeliveryDetail(deliverys[index].delId),
                          ),
                        );
                      },
                      child: Card(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(deliverys[index].delCusName),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15,
                    ),
                    LinearProgressIndicator(),
                  ],
                ),
              );
            }
          },
        ));
  }
}
