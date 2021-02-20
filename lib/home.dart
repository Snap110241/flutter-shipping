import 'package:flutter/material.dart';

import 'delivery.dart';
import 'succecs.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {static const String _title = 'การจัดส่งสินค้า';
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: _title,
    home: Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: MyStatelessWidget(),
    ),
  );
}
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          const SizedBox(height: 30),
          RaisedButton(

            child: const Text('คิวส่งสินค้า', style: TextStyle(fontSize: 20)),
              onPressed: () => Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => Delivery())
          )
          ),
        ],
      ),
    );
  }
}
