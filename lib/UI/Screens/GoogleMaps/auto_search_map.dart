// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:search_map_place_updated/search_map_place_updated.dart';
// import 'package:sharqia_household_survey/Resources/colors.dart';
// import 'package:sharqia_household_survey/Resources/sizes.dart';
//
// import '../../Widgets/custom_buttton.dart';
// import '../trips/provider/trip_provider.dart';
//
// class Constants {
//   static LatLng location =
//       const LatLng(26.396790, 50.140400); //26.396790, 50.140400
//   LatLng? location2;
//
//   static double defaultZoom = 19.151926040649414;
// }
//
// class MapSearchScreen extends StatefulWidget {
//   const MapSearchScreen({Key? key, required this.callBack}) : super(key: key);
//   final Function callBack;
//
//   @override
//   State<MapSearchScreen> createState() => _MapSearchScreenState();
// }
//
// class _MapSearchScreenState extends State<MapSearchScreen> {
//   Completer<GoogleMapController> completer = Completer<GoogleMapController>();
//
//   late double initZoom = Constants.defaultZoom;
//
//   late LatLng initCoordinates = Constants.location;
//
//   List<Placemark> placeMarks = [];
//
//   LatLng? value;
//
//   GoogleMapController? controller;
//
//   futureCall() async {
//     final validationService = Provider.of<TripProvider>(context, listen: false);
//
//     var position = await validationService.determinePosition();
//     placeMarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Constants.location != LatLng(position.latitude, position.longitude);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     if (controller != null) controller!.dispose();
//     completer = Completer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder(
//             future: futureCall(),
//             builder: (_, dataSnapshot) {
//               return Stack(
//                 children: <Widget>[
//                   SizedBox(
//                     height: height(context),
//                     width: width(context),
//                     child: GoogleMap(
//                       initialCameraPosition: CameraPosition(
//                         target: initCoordinates,
//                         zoom: initZoom,
//                       ),
//                       onMapCreated: (GoogleMapController controller) {
//                         if (!completer.isCompleted) {
//                           completer.complete(controller);
//                         }
//                       },
//                       onCameraMove: (CameraPosition newPosition) {
//                         value = newPosition.target;
//                       },
//                       mapType: MapType.normal,
//                       myLocationButtonEnabled: false,
//                       //
//                       myLocationEnabled: false,
//                       //
//                       zoomGesturesEnabled: true,
//                       padding: const EdgeInsets.all(0),
//                       buildingsEnabled: true,
//                       cameraTargetBounds: CameraTargetBounds.unbounded,
//                       compassEnabled: false,
//                       //
//                       indoorViewEnabled: false,
//                       mapToolbarEnabled: false,
//                       minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
//                       rotateGesturesEnabled: true,
//                       scrollGesturesEnabled: true,
//                       tiltGesturesEnabled: true,
//                       trafficEnabled: false,
//                     ),
//                   ),
//                   Positioned(
//                     top: 40,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: SizedBox(
//                         width: width(context) * .9,
//                         child: SearchMapPlaceWidget(
//                           strictBounds: true,
//                           hasClearButton: true,
//                           placeType: PlaceType.address,
//                           bgColor: ColorManager.grayLiner,
//                           textColor: ColorManager.primaryColor,
//                           iconColor: ColorManager.primaryColor,
//                           placeholder: 'بحث',
//                           apiKey: 'AIzaSyAMIcLjXga58HVN5RkLX5NGf1zh-Qkk4fg',
//                           onSelected: (Place place) async {
//                             if (mounted) {
//                               Geolocation? geolocation =
//                                   await place.geolocation;
//
//                               controller = await completer.future;
//                               // await Future.delayed(
//                               //     const Duration(milliseconds: 500));
//
//                               await controller!.animateCamera(
//                                   CameraUpdate.newLatLng(
//                                       geolocation!.coordinates));
//
//                               // await Future.delayed(
//                               //     const Duration(milliseconds: 500));
//                               if (!completer.isCompleted) {
//                                 await controller!.animateCamera(
//                                     CameraUpdate.newLatLngBounds(
//                                         geolocation.bounds, 0));
//                               }
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 0,
//                     bottom: 0,
//                     //you can use "right" and "bottom" too
//                     child: Padding(
//                       padding: EdgeInsets.all(AppSize.padding2(context)),
//                       child: DefaultButton(
//                           text: "حفظ",
//                           function: () async {
//                             final validationService = Provider.of<TripProvider>(
//                                 context,
//                                 listen: false);
//                             try {
//                               Position position =
//                               await validationService.determinePosition();
//                               await widget.callBack(value ??
//                                   LatLng(
//                                       position.latitude, position.longitude));
//                               Navigator.of(context, rootNavigator: true).pop();
//                             } on Exception {
//                               rethrow;
//                             }
//                           },
//                           isWidget: true),
//                     ),
//                   ),
//                   Positioned(
//                     top: height(context) / 2,
//                     bottom: height(context) / 2,
//                     left: width(context) / 2,
//                     right: width(context) / 2,
//                     child: Container(
//                       color: Colors.transparent,
//                       child: const Icon(
//                         Icons.pin_drop_outlined,
//                         size: 40,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 5,
//                     left: 5,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: ColorManager.primaryColor),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: IconButton(
//                         onPressed: () async {
//                           Navigator.of(context).pop();
//                         },
//                         padding: const EdgeInsets.all(3),
//                         constraints: const BoxConstraints(),
//                         icon: const Icon(Icons.arrow_forward_ios_outlined),
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             }),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/GoogleMaps/search_map.dart';

import '../../Widgets/custom_buttton.dart';
import '../trips/provider/trip_provider.dart';

class Constants {
  static LatLng location =
      const LatLng(26.396790, 50.140400); //26.396790, 50.140400
  LatLng? location2;

  static double defaultZoom = 19.151926040649414;
}

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({Key? key, required this.callBack}) : super(key: key);
  final Function callBack;

  @override
  State<MapSearchScreen> createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  Completer<GoogleMapController> _completer = Completer();
  late final double _initZoom = Constants.defaultZoom;
  late final LatLng _initCoordinates = Constants.location;
  List<Placemark> _placeMarks = [];
  LatLng? _value;
  GoogleMapController? _controller;

  Future<void> _futureCall() async {
    final validationService = Provider.of<TripProvider>(context, listen: false);
    var position = await validationService.determinePosition();
    _placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Constants.location = LatLng(position.latitude, position.longitude);
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) _controller!.dispose();
    _completer = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _futureCall(),
            builder: (_, dataSnapshot) {
              return Stack(
                children: <Widget>[
                  _buildGoogleMap(),
                  _buildSearchBar(),
                  _buildSaveButton(),
                  _buildMapPin(),
                  _buildBackButton(),
                ],
              );
            }),
      ),
    );
  }

  Widget _buildGoogleMap() {
    return SizedBox(
      height: height(context),
      width: width(context),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initCoordinates,
          zoom: _initZoom,
        ),
        onMapCreated: (GoogleMapController controller) {
          if (!_completer.isCompleted) {
            _completer.complete(controller);
          }
        },
        onCameraMove: (CameraPosition newPosition) {
          _value = newPosition.target;
        },
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        zoomGesturesEnabled: true,
        padding: const EdgeInsets.all(0),
        buildingsEnabled: true,
        cameraTargetBounds: CameraTargetBounds.unbounded,
        compassEnabled: false,
        indoorViewEnabled: false,
        mapToolbarEnabled: false,
        minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        trafficEnabled: false,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 40,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: width(context) * .9,
          child: SearchMapPlaceWidget(
            strictBounds: true,
            hasClearButton: true,
            placeType: PlaceType.address,
            bgColor: ColorManager.grayLiner,
            textColor: ColorManager.primaryColor,
            iconColor: ColorManager.primaryColor,
            placeholder: 'بحث',
            apiKey: 'AIzaSyAMIcLjXga58HVN5RkLX5NGf1zh-Qkk4fg',
            onSelected: (Place place) async {
              if (mounted) {
                Geolocation? geolocation = await place.geolocation;

                _controller = await _completer.future;
                await Future.delayed(const Duration(milliseconds: 500));

                _controller!.animateCamera(
                    CameraUpdate.newLatLng(geolocation!.coordinates));

                await Future.delayed(const Duration(milliseconds: 500));
                if (!_completer.isCompleted) {
                  _controller!.animateCamera(
                      CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Padding(
        padding: EdgeInsets.all(AppSize.padding2(context)),
        child: DefaultButton(
            text: "حفظ",
            function: () async {
              final validationService =
                  Provider.of<TripProvider>(context, listen: false);

              Position position = await validationService.determinePosition();
              if (_value == null) {
                widget.callBack(LatLng(position.latitude, position.longitude));
              } else {
                widget.callBack(_value);
              }
              if (mounted) Navigator.pop(context);
            },
            isWidget: true),
      ),
    );
  }

  Widget _buildMapPin() {
    return Positioned(
      top: height(context) / 2,
      bottom: height(context) / 2,
      left: width(context) / 2,
      right: width(context) / 2,
      child: Container(
        color: Colors.transparent,
        child: const Icon(
          Icons.pin_drop_outlined,
          size: 40,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 5,
      left: 5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ColorManager.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          padding: const EdgeInsets.all(3),
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}
