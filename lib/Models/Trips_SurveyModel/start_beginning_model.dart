

import 'package:flutter/material.dart';

class StartBeginningModel {
  String? tripAddressLat ;
  String? tripAddressLong;
  TextEditingController streetName = TextEditingController();
  TextEditingController streetNumber = TextEditingController();
  TextEditingController nearestLandMark = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController area = TextEditingController();

  StartBeginningModel({
    required this.tripAddressLong,
    required this.tripAddressLat,
    required this.nearestLandMark,
    required this.streetNumber,
    required this.streetName,
    required this.area,
    required this.block,
  });

  StartBeginningModel.fromJson(Map<String, dynamic> json) {
    tripAddressLat = json['tripAddressLat'];
    tripAddressLong = json['tripAddressLong'];
    streetName.text = json['streetName'];
    streetNumber.text = json['streetNumber'];
    nearestLandMark.text = json['nearestLandMark'];
    block.text = json['block'];
    area.text = json['area'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['tripAddressLat'] = tripAddressLat;
    data['tripAddressLong'] = tripAddressLong;
    data['streetName'] = streetName.text;
    data['streetNumber'] = streetNumber.text;
    data['nearestLandMark'] = nearestLandMark.text;
    data['block'] = block.text;
    data['area'] = area.text;
    return data;
  }
}
