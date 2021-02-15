import 'package:flutter/material.dart';
import 'package:flutter_workshop/tabs/map.dart';

class DeliveryDetail extends StatefulWidget {
  @override
  _DeliveryDetailState createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {

  @override
  Widget build(BuildContext context) {
    final items = ['order 1' , 'order 2' , 'order 3' , 'order 4'
      , 'order 5' , 'order 6' , 'order 7' , 'order 8'
      , 'order 9' , 'order 10' , 'order 11' , 'order 12'];
    return Scaffold(
        appBar: AppBar(
          title: Text('รายละเอียดคิวส่งสินค้า'),
        ),
    body: DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    color: const Color(0xffeeee00), // Yellow
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('ชื่อลูกค้า'),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text('นาย xxxx'),
                        ),

                      ],
                    ),

                  ),
                  Container(
                    color: Colors.cyan,
                    height: 70,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('ที่อยู่ลูกค้า'),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text('12/2'),
                        ),
                      ],
                    ),

                  ),
                  Container(
                    // Another fixed-height child.
                    color: const Color(0xff008000), // Green
                    height: 30.0,
                    alignment: Alignment.topCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 6, // 20%
                          child: Container(
                              color: Colors.red,
                            child: const Text('สินค้า'),
                          ),

                        ),
                        Expanded(
                          flex: 2, // 60%
                          child: Container(
                              color: Colors.green,
                            child: const Text('จำนวน'),
                          ),
                        ),
                        Expanded(
                          flex: 2, // 20%
                          child: Container(
                              color: Colors.blue,
                            child: const Text('ราคา'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: const Color(0xff008000), // Green
                    height: 400.0,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 6, // 20%
                          child: Container(color: Colors.red),
                        ),
                        Expanded(
                          flex: 2, // 60%
                          child: Container(color: Colors.green),
                        ),
                        Expanded(
                          flex: 2, // 20%
                          child: Container(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.topRight,
                    child: Row (
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                            child: Text('Map'),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Map())
                            )
                        ),
                        RaisedButton(
                            child: Text('ส่งสำเร็จ'),
                            onPressed: () => {}

                        ),
                        RaisedButton(
                            child: Text('ค้างส่ง'),
                            onPressed: () => {}
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('ราคารวม'),
                        ),
                      ],
                    ),
                  )



                ],

              )
              ),
            );
        },
      ),
    ),
    );
  }
  }


