import 'dart:async';

import 'package:elektra_app/sirvices/getSteps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/locatio.dart';
import 'models/steps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}



class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  List<LocationDatos> ccc;
  LocationDatos data;
  List<LatLng> latlng = List();
 List<Marker> marcador = [];
 final Set<Polyline>_polyline={};
 LatLng _new ;
  
  getDirectionSteps() {
    print('metodo api');
    getSteps();
    /*gt.getd()
        .then((res) {
      List<Steps> rr = res;
      print(res.toString());

      
      for (final i in rr) {
        latlng.add(new LatLng (double.parse(i.startLocation.toString()),double.parse(i.endLocation.toString())));
      }

      
        //marcador.add(Marker(location.latitude,location.longitude,destinationLat,destinationLng));
        marcador.add(
          Marker(
            markerId: MarkerId('Inicio'),
            position: LatLng(37.42796133580664, -122.085749655962)
          ),
        );
        marcador.add(
          Marker(
            markerId: MarkerId('Destino'),
            position: LatLng(37.43296265331129, 2-122.08574965596)
          ),
        );
        //addPolyline(new Polyline("12", ccc, width: 15.0));
        _polyline.add(Polyline(
            polylineId: PolylineId('ruta'),
            visible: true,
            //latlng is List<LatLng>
            points: latlng,
            color: Colors.blue,
        ));
    });*/
  }
  
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, 2-122.08574965596),
    zoom: 14.4746,
  );
 
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  @override
  Widget build(BuildContext context) {
 

    return new Scaffold(
      body: GoogleMap(
        markers: Set.from(marcador),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getDirectionSteps(),
        label: Text('ruta'),
        icon: Icon(Icons.location_city),
        tooltip:'press',
      ),
    );
  }

  
}