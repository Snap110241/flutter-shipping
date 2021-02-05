import 'package:flutter/material.dart';

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
            onPressed: () {},
            child: const Text('คิวส่งสินค้า', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
              const Text('จัดส่งสินค้า', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
