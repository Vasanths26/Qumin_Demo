// ignore_for_file: library_private_types_in_public_api

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStore with _$LocationStore;

abstract class _LocationStore with Store {
  @observable
  List<String> locationDetails = [];

  @action
  Future<void> fetchLocationDetails() async {
    final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

    LocationPermission permission = await geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      locationDetails = ['Location permission denied.'];
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    double latitude = position.latitude;
    double longitude = position.longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String city = placemark.locality ?? '';
      String district = placemark.subAdministrativeArea ?? '';
      String state = placemark.administrativeArea ?? '';
      locationDetails = [city, district, state];
    } else {
      locationDetails = ['Location not found.'];
    }
  }
}
