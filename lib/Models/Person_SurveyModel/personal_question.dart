import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_data.dart';

class PersonalQuestion {
  String? haveBusPass;
  String? haveDisabilityTransportMobility;
  String? drivingLicenceType; //if age>17
  TextEditingController drivingLicenceTypeController = TextEditingController();
  TextEditingController haveDisabilityTransportMobilityController =
      TextEditingController();
  String? mainOccupationType;

  //if age>15
  String? availablePersonalCar; //if user have driving licence
  String? asPassenger; //if user do not have driving licence
  bool? haveCarSharing;
  EducationAddress? educationAddress; //if age <15

  PersonalQuestion({
    this.mainOccupationType,
    required this.drivingLicenceTypeController,
    required this.haveDisabilityTransportMobilityController,
    this.educationAddress,
    this.asPassenger,
    this.availablePersonalCar,
    this.drivingLicenceType,
    this.haveBusPass,
    this.haveCarSharing,
    this.haveDisabilityTransportMobility,
  });

  PersonalQuestion.fromJson(Map<String, dynamic> json) {
    drivingLicenceType = json['drivingLicenceType'] ??
        PersonData.licence[" ? What type of driving licence do you have"][0];
    haveDisabilityTransportMobility = json['haveDisabilityTransportMobility'] ??
        PersonData.transporterMoblity[
            "?Do you have any disability/Special Needs for Transport Mobility"][0];
    haveBusPass = json['haveBusPass'] ?? "";
    mainOccupationType = json['mainOccupationType'] ??
        PersonData.mainOccupation["MainOccupation"][0]['value'];
    availablePersonalCar = json['availablePersonalCar'] ??
        PersonData.drivingLiences["?What type of driving licence do you have"]
            [0];
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
