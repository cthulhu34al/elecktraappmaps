
import 'package:location/location.dart';

import 'locatio.dart';

class Steps {
  LocationDatos startLocation;
  LocationDatos endLocation;
  

  
  Steps({this.startLocation, this.endLocation});
  factory Steps.fromJson(Map<String, dynamic> json) {  
    return new Steps(
        startLocation:  new LocationDatos(
            json["start_location"]["lat"], json["start_location"]["lng"]),
        endLocation: new LocationDatos(
            json["end_location"]["lat"], json["end_location"]["lng"]));
  }
}