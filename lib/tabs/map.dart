
import 'package:flutter/material.dart';

class Map extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แผนที่'),
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2,
        child: LayoutBuilder(
          builder: ((BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Text('Map'),
            );
    }
    )
    )
      )
    );


  }
}

