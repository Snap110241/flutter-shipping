import 'package:flutter/material.dart';
import 'package:flutter_workshop/delivery_detail..dart';


class Delivery extends StatefulWidget {

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {


  @override
  Widget build(BuildContext context) {
    final items = ['order 1' , 'order 2' , 'order 3' , 'order 4'
                , 'order 5' , 'order 6' , 'order 7' , 'order 8'
                , 'order 9' , 'order 10' , 'order 11' , 'order 12'];
    return Scaffold(
        appBar: AppBar(
          title: Text('คิวส่งสินค้า'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryDetail())
                    ),
              );
            }
        )
    );
  }
}
