import 'package:flutter/material.dart';

import 'models/delivery.model.dart';
import 'services/delivery.service.dart';

class BacklogDelivery extends StatefulWidget {
  @override
  _BacklogDeliveryState createState() => _BacklogDeliveryState();
}

class _BacklogDeliveryState extends State<BacklogDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('คิวสค้าง่งสินค้า'),
        ),
        body: FutureBuilder(
          future: DeliveryService().getDeliverys(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<DeliveryModel> delivery = snapshot.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  delivery.length,
                  (int index) => SizedBox(
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        print(delivery[index].delId);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         BacklogDeliveryDetail(deliverys[index].delId),
                        //   ),
                        // );
                      },
                      child: Card(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(delivery[index].delCusName),
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
