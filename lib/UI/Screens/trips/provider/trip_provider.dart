import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';

class TripProvider extends ChangeNotifier {
  List<String> personTrip = [];

  removeTrip(int i) {
    TripModeList.tripModeList.removeAt(i);
    notifyListeners();
  }

  initTrip() {
    TripModeList.tripModeList[0].person = [];
    for (int i = 0; i < PersonModelList.personModelList.length; i++) {
      TripModeList.tripModeList[0].person
          .add(PersonModelList.personModelList[i].personName.text);
    }
    // notifyListeners();
  }

  addOwnerTrip(int i, String p) {
    TripModeList.tripModeList[i].friendPerson["friendPerson"] = [];
    for (int x = 0; x < TripModeList.tripModeList[i].person.length; x++) {
      if (TripModeList.tripModeList[i].person[x].toString() != p) {
        TripModeList.tripModeList[i].friendPerson["friendPerson"].add({
          "value": TripModeList.tripModeList[i].person[x],
          "isChick": false
        });
      }
    }

    TripModeList.tripModeList[i].chosenPerson = p;

    notifyListeners();
  }

  ///Search Map
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    notifyListeners();
    return await Geolocator.getCurrentPosition();
  }

  activeLocation(List<Placemark> placeMarks, BuildContext context,
      LatLng? value1, callBack) async {
    placeMarks =
        await placemarkFromCoordinates(value1!.latitude, value1.longitude)
            .then((value) async {
      await callBack(value);
      notifyListeners();
      return value;
    });
  }
}
