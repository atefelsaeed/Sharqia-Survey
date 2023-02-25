import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';

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

  ownerChipCar(String p, TextEditingController textEditingController) {
    VehModel.ownerShipCode = p.toString();
    if (VehModel.ownerShipCode != "أخر") {
      textEditingController.text = VehModel.ownerShipCode;
    } else {
      textEditingController.text = 'أخر';
    }
    notifyListeners();
  }

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
            VehModel.eScooter.length;
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
            VehModel.eScooter.length;
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
            VehModel.eScooter.length;
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
            VehModel.eScooter.length;
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
    }
    notifyListeners();
  }

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
            VehModel.eScooter.length;
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

  int vecTotal = 0;

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
            VehModel.eScooter.length;
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
            VehModel.eScooter.length;
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
}
