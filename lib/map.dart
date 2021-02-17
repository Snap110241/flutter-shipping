import 'package:flutter/material.dart';
import 'package:flutter_workshop/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}



class _MapState extends State<Map> {
  GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('แผนที่'),
        ),
        //   body: DefaultTextStyle(
        //     style: Theme.of(context).textTheme.bodyText2,
        //     child: LayoutBuilder(builder:
        //         ((BuildContext context, BoxConstraints viewportConstraints) {
        //       return SingleChildScrollView(
        //         child: Text('Map'),
        //       );
        //     })),
        //   ),
        // );
        body: GoogleMap(
          onMapCreated: onMapCreate,
          initialCameraPosition:
              CameraPosition(target: LatLng(40.6782, -73.9442), zoom: 14.0),
          mapType: MapType.normal,
        ));
  }

  void onMapCreate(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }
}
