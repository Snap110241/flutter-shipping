import 'package:flutter/material.dart';
import 'package:flutter_workshop/delivery_detail..dart';

import 'successdetail.dart';


class Success extends StatefulWidget {

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {


  @override
  Widget build(BuildContext context) {
    final items = ['order 1' , 'order 2' , 'order 3' , 'order 4'
      , 'order 5' , 'order 6' , 'order 7' , 'order 8'
      , 'order 9' , 'order 10' , 'order 11' , 'order 12'];
    return Scaffold(
        appBar: AppBar(
          title: Text('ส่งสำเร็จ'),
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
                            builder: (context) => SucceccDetail())
                    ),
              );
            }
        )
    );
  }
}
