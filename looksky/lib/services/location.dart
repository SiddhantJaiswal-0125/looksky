import 'package:geolocator/geolocator.dart';

class location {
  double longitude, latitude;

  Future<void> getCurrentLocation() async {
    //getting current location using Geolocator package

    // Future <Position> pos = Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;

      print(position);
    } catch (e) {
      print(e);
    }
  }
}
