import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Data/app_constants.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../../Providers/user_surveys.dart';
import '../reset_values.dart';

class VecProvider extends ChangeNotifier {
  changeVec(index, bool value) {
    VehiclesData.vecModel[index].isChosen = value;
    if (VehiclesData.vecModel[index].isChosen == false) {
      VehiclesData.vecModel[index].textEditingController.text = 0.toString();
    }
    if (value == false) {
      switch (VehiclesData.vecModel[index].title) {
        case "سيارة صغيرة":
          VehModel.vecCar.clear();
          break;
        case "سيارة كبيرة":
          VehModel.largeCar.clear();
          break;
        case "شاحنة":
          VehModel.vecVan.clear();
          break;
        case " اسكوتر":
          VehModel.eScooter.clear();
          break;
        case "ونيت":
          VehModel.vecWanet.clear();
          break;
        case "دراجة نارية":
          VehModel.pickUp.clear();
          break;
        case "دراجة هوائية":
          VehModel.bicycle.clear();
          break;
        case "عربية بضائع خفيفة":
          VehModel.vecLightCargo.clear();
          break;
        case "عربية بضائع ثقيلة":
          VehModel.eScooter.clear();
          break;
        case "مينى باص":
          VehModel.eScooter.clear();
          break;
        case "كوستر":
          VehModel.vecCoaster.clear();
          break;
        case "اوتوبيس":
          VehModel.vecBus.clear();
          break;
      }
    }
    notifyListeners();
  }

  removeVec(final List<VehicleBodyDetails> listVec, int i, int x) {
    listVec.removeAt(i);
    VehiclesData.vecModel[x].textEditingController.text =
        listVec.length.toString();
    notifyListeners();
  }

  parkThisCar(String p, TextEditingController textEditingController) {
    VehModel.parkThisCar = p.toString();
    if (VehModel.parkThisCar != "أخر") {
      textEditingController.text = VehModel.parkThisCar;
    } else {
      textEditingController.text = "أخر";
    }
    notifyListeners();
  }

  largeItemCar(String p, TextEditingController textEditingController) {
    VehModel.largeItemCar = p.toString();
    if (VehModel.largeItemCar != "أخر") {
      textEditingController.text = VehModel.largeItemCar;
      notifyListeners();
    } else {
      textEditingController.text = "أخر";
      notifyListeners();
    }
  }

  ownerChipCar(String p, TextEditingController textEditingController) {
    VehModel.ownerShipCode = p.toString();
    if (VehModel.ownerShipCode != "أخر") {
      textEditingController.text = VehModel.ownerShipCode;
      notifyListeners();
    } else {
      textEditingController.text = 'أخر';
      notifyListeners();
    }
  }

  int vecTotal = 0;

  ///vecCar
  vecCar(Function showVechError, String d, Function showError) {
    VehModel.vecCar = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());

        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.vecCar.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecWent
  vecWent(Function showVechError, String d, Function showError) {
    VehModel.vecWanet = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());

        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.vecWanet.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecLargeCar
  vecLargeCar(Function showVechError, String d, Function showError) {
    VehModel.largeCar = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());

        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.largeCar.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecVan
  vecVan(Function showVechError, String d, Function showError) {
    VehModel.vecVan = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());

        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.vecVan.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecBicycle
  vecBicycle(Function showVechError, String d, Function showError) {
    VehModel.bicycle = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());

        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.bicycle.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecEScooter
  vecEScooter(Function showVechError, String d, Function showError) {
    VehModel.eScooter = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());

        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.eScooter.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecPickUp
  vecPickUp(Function showVechError, String d, Function showError) {
    VehModel.pickUp = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.pickUp.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecLightCargo
  vecLightCargo(Function showVechError, String d, Function showError) {
    VehModel.vecLightCargo = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;
        vecTotal = total;
        if (x > total) {
          VehModel.vecLightCargo.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecHeavyCargo
  vecHeavyCargo(Function showVechError, String d, Function showError) {
    VehModel.vecHeavyCargo = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.vecHeavyCargo.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecMinibus
  vecMinibus(Function showVechError, String d, Function showError) {
    VehModel.vecMinibus = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.vecMinibus.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecBus
  vecBus(Function showVechError, String d, Function showError) {
    VehModel.vecBus = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;

        vecTotal = total;
        if (x > total) {
          VehModel.vecBus.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecCoaster
  vecCoaster(Function showVechError, String d, Function showError) {
    VehModel.vecCoaster = [];
    if (HhsStatic.houseHold[0].totalNumberVehicles.toString().isEmpty ||
        HhsStatic.houseHold[0].totalNumberVehicles.toString().trim() == '0') {
      showVechError();
    } else {
      for (int i = 0; i < int.parse(d); i++) {
        int x =
            int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
        int total = VehModel.bicycle.length +
            VehModel.vecCar.length +
            VehModel.largeCar.length +
            VehModel.vecWanet.length +
            VehModel.vecVan.length +
            VehModel.pickUp.length +
            VehModel.eScooter.length +
            VehModel.vecLightCargo.length +
            VehModel.vecHeavyCargo.length +
            VehModel.vecCoaster.length +
            VehModel.vecBus.length +
            VehModel.vecMinibus.length;
        vecTotal = total;
        if (x > total) {
          VehModel.vecCoaster.add(
            VehicleBodyDetails(
              vehicleParking: TextEditingController(),
              vehicleOwnership: TextEditingController(),
              vehicleFuelType: TextEditingController(),
            ),
          );
        } else {
          showError();
          return;
        }
      }
      notifyListeners();
    }
  }

  ///vecClear
  vecClear(index) {
    switch (VehiclesData.vecModel[index].title) {
      case "سيارة صغيرة":
        VehModel.vecCar.clear();
        break;
      case "شاحنة":
        VehModel.vecVan.clear();
        break;
      case "ونيت":
        VehModel.vecWanet.clear();
        break;
      case "سيارة كبيرة":
        VehModel.largeCar.clear();
        break;
      case "دراجة نارية":
        VehModel.pickUp.clear();
        break;
      case "دراجة هوائية":
        VehModel.bicycle.clear();
        break;
      case " اسكوتر":
        VehModel.eScooter.clear();
        break;
      case "عربية بضائع خفيفة":
        VehModel.vecLightCargo.clear();
        break;
      case "عربية بضائع ثقيلة":
        VehModel.eScooter.clear();
        break;
      case "مينى باص":
        VehModel.eScooter.clear();
        break;
      case "كوستر":
        VehModel.vecCoaster.clear();
        break;
      case "اوتوبيس":
        VehModel.vecBus.clear();
        break;
    }
    notifyListeners();
  }

  ///resetVechValues
  resetVechValues(context) async {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);

    final prefs = await SharedPreferences.getInstance();
    bool? isFilled = prefs.getBool(AppConstants.isFilled);

    if (isFilled != null && isFilled == true) {
      debugPrint('Not Filled Survey');
      await ResetVechilesValues.resetVechValues(context);
    } else if ((userSurveysProvider.userSurveyStatus == 'edit' &&
        AppConstants.isResetVec == true)) {
      debugPrint('Edit Survey');
      await ResetVechilesValues.resetVechValues(context);
      AppConstants.isResetVec = false;
    } else {
      debugPrint('New Survey');
    }

    notifyListeners();
  }
}
