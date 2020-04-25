import 'package:geolocator/geolocator.dart';

var openWeatherMapApiKey = 'e542f831aca4693ae9887bddb0efe71d';

class Location {
  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
