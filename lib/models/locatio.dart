class LocationDatos {
  final double latitude;
  final double longitude;

  LocationDatos(this.latitude, this.longitude);

  factory LocationDatos.fromMap(Map<String, double> dataMap) {
    return LocationDatos(
      dataMap['latitude'],
      dataMap['longitude'],
    );
  }
}