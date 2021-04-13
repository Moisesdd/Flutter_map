import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MapController _mapController;

  @override
  void initState() {
    _mapController = MapController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.zoom_out),
      onPressed: (){
        var newzoom = _mapController.zoom - 1;
        _mapController.move(_mapController.center, newzoom);
      },
      ),
    body: FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new PolylineLayerOptions(polylines: [
          Polyline(
            points: [LatLng(51.50, -0.09),
                     LatLng(51.51, -0.08),
                     LatLng(51.52, -0.08),
                     LatLng(51.53, -0.07),
                     LatLng(51.55, -0.08)],
            color: Colors.red,
            strokeWidth: 4.0,
          ),
          Polyline(
            points: [LatLng(51.55, -0.08),
                     LatLng(51.56, -0.08),
                     LatLng(51.57, -0.12),
                     LatLng(51.58, -0.07),
                     LatLng(51.59, -0.12)],
            color: Colors.red,
            strokeWidth: 4.0,
          ),
        ]),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(51.55, -0.08),
              
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
