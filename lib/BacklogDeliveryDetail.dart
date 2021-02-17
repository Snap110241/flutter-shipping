import 'package:flutter/material.dart';
import 'file:///C:/Users/nunan/Desktop/flutter-shipping/lib/map.dart';

class BacklogDeliveryDetail extends StatefulWidget {
  @override
  _BacklogDeliveryDetailState createState() => _BacklogDeliveryDetailState();
}

class _BacklogDeliveryDetailState extends State<BacklogDeliveryDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดคิวส่งสินค้า'),
      ),
      body: DefaultTextStyle(
        style: Theme
            .of(context)
            .textTheme
            .bodyText2,
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 6, // 20%
                              child: Container(
                                color: Colors.red,
                                child: const Text('xxxx'),
                              ),
                            ),
                            Expanded(
                              flex: 2, // 60%
                              child: Container(
                                color: Colors.green,
                                child: const Text('xxxxx'),
                              ),
                            ),
                            Expanded(
                              flex: 2, // 20%
                              child: Container(
                                color: Colors.blue,
                                child: const Text('xxxx'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.topRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            RaisedButton(

                                child: Text('Map'),
                                onPressed: () =>
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Map())
                                    )
                            ),

                            RaisedButton(
                                child: Text('ส่งสำเร็จ'),
                                elevation: 6.0,
                                onPressed: () =>
                                {
                                  Shipcom(context),
                                }
                            ),

                            Expanded(
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
        }
    );
  }
}


