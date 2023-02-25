import 'package:flutter/material.dart';

class PersonalQuestion {
  String? haveBusPass;
  String? haveDisabilityTransportMobility;
  String? drivingLicenceType; //if age>17
  String? mainOccupationType; //if age>15
  String? availablePersonalCar; //if user have driving licence
  String? asPassenger; //if user do not have driving licence
  bool? haveCarSharing;
  EducationAddress? educationAddress; //if age <15

  PersonalQuestion({
    this.mainOccupationType,
    this.educationAddress,
    this.asPassenger,
    this.availablePersonalCar,
    this.drivingLicenceType,
    this.haveBusPass,
    this.haveCarSharing,
    this.haveDisabilityTransportMobility,
  });

  PersonalQuestion.fromJson(Map<String, dynamic> json) {
    drivingLicenceType = json['drivingLicenceType'] ?? "";
    haveDisabilityTransportMobility =
        json['haveDisabilityTransportMobility'] ?? "";
    haveBusPass = json['haveBusPass'] ?? "";
    mainOccupationType = json['mainOccupationType'] ?? "";
    availablePersonalCar = json['availablePersonalCar'] ?? "";
    haveCarSharing = json['haveCarSharing'] ?? "";
    educationAddress = (EducationAddress.fromJson(json['educationAddress']));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['drivingLicenceType'] = drivingLicenceType ?? "";
    data['haveBusPass'] = haveBusPass ?? "";
    data['mainOccupationType'] = mainOccupationType ?? "";
    data['haveDisabilityTransportMobility'] = haveDisabilityTransportMobility;

    data['availablePersonalCar'] = availablePersonalCar ?? "";
    data['haveCarSharing'] = haveCarSharing ?? "";
    data['educationAddress'] = educationAddress!.toJson();
    return data;
  }
}

class EducationAddress {
  TextEditingController fullAddress = TextEditingController();
  TextEditingController geocodes = TextEditingController();

  EducationAddress({
    required this.fullAddress,
    required this.geocodes,
  });

  EducationAddress.fromJson(Map<String, dynamic> json) {
    fullAddress.text = json['fullAddress'] ?? "";
    geocodes.text = json['geocodes'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['fullAddress'] = fullAddress.text;
    data['geocodes'] = geocodes.text;
    return data;
  }
}
