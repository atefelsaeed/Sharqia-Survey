import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';

import '../../../Resources/sizes.dart';

class HomeSearchMap extends StatefulWidget {
  const HomeSearchMap({Key? key}) : super(key: key);

  @override
  _HomeSearchMapState createState() => _HomeSearchMapState();
}

class _HomeSearchMapState extends State<HomeSearchMap> {
  @override
  void initState() {
    super.initState();
    determinePosition();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  late GoogleMapController mapController;
  LatLng? initPosition;

  LatLng? currentLatLng;

  LocationPermission? permission;

  bool checkReady(LatLng? x, LocationPermission? y) {
    if (x == initPosition ||
        y == LocationPermission.denied ||
        y == LocationPermission.deniedForever) {
      return true;
    } else {
      return false;
    }
  }

  Future<Position?> determinePosition() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchMapPlaceWidget(
          strictBounds: true,
          hasClearButton: true,
          placeType: PlaceType.address,
          bgColor: ColorManager.whiteColor,
          textColor: ColorManager.grayColor,
          iconColor: ColorManager.grayText,
          placeholder: 'Enter the location',
          apiKey: 'AIzaSyAMIcLjXga58HVN5RkLX5NGf1zh-Qkk4fg',
          onSelected: (Place place) async {
            Geolocation? geolocation = await place.geolocation;
            mapController.animateCamera(
                CameraUpdate.newLatLng(geolocation!.coordinates));
            mapController.animateCamera(
                CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
          },
        ),
        checkReady(currentLatLng, permission)
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: width(context),
                height: height(context) * .6,
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController googleMapController) {
                    setState(() {
                      mapController = googleMapController;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    bearing: 0,
                    target: currentLatLng!,
                    zoom: 15.0,
                  ),
                ),
              ),
      ],
    );
  }
}
