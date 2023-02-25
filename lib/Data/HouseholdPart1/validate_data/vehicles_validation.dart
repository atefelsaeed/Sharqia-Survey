import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Helper/validator.dart';
import 'package:sharqia_household_survey/UI/Screens/person/person_screen.dart';

import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../VechelisData/veh_model.dart';

class CheckVehiclesValidation {
  static validate(context) {
    int x = int.parse(HhsStatic.houseHold[0].totalNumberVehicles.toString());
    int total = VehModel.bicycle.length +
        VehModel.vecCar.length +
        VehModel.largeCar.length +
        VehModel.vecWanet.length +
        VehModel.vecVan.length +
        VehModel.pickUp.length +
        VehModel.eScooter.length;

    ///vecCar
    for (int i = 0; i <= VehModel.vecCar.length; i++) {
      if (i < VehModel.vecCar.length) {
        if (VehModel.vecCar[i].vehicleFuelType.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
        } else if (VehModel.vecCar[i].vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (VehModel.vecCar[i].vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }

    ///largeCar
    for (int i = 0; i <= VehModel.largeCar.length; i++) {
      print('ser');

      if (i < VehModel.largeCar.length) {
        print('ser');

        if (VehModel.largeCar[i].vehicleFuelType.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
        } else if (VehModel.largeCar[i].vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (VehModel.largeCar[i].vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }

    ///vecWanet
    for (int i = 0; i <= VehModel.vecWanet.length; i++) {
      if (i < VehModel.vecWanet.length) {
        if (VehModel.vecWanet[i].vehicleFuelType.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
        } else if (VehModel.vecWanet[i].vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (VehModel.vecWanet[i].vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }

    ///vecVan
    for (int i = 0; i <= VehModel.vecVan.length; i++) {
      if (i < VehModel.vecVan.length) {
        if (VehModel.vecVan[i].vehicleFuelType.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
        } else if (VehModel.vecVan[i].vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (VehModel.vecVan[i].vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }

    ///pickUp
    for (int i = 0; i <= VehModel.pickUp.length; i++) {
      if (i < VehModel.pickUp.length) {
        var base = VehModel.pickUp[i];

        if (base.vehicleFuelType.text.isEmpty ||
            base.vehicleFuelType.text == "") {
          return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
        } else if (base.vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (base.vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }

    ///eScooter
    for (int i = 0; i <= VehModel.eScooter.length; i++) {
      if (i < VehModel.eScooter.length) {
        if (VehModel.eScooter[i].vehicleFuelType.text.isEmpty ||
            VehModel.eScooter[i].vehicleFuelType.text == "") {
          return Validator.showSnack(context, " يجب إخيار ! أكواد نوع الوقود؟");
        } else if (VehModel.eScooter[i].vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (VehModel.eScooter[i].vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }

    ///bicycle
    for (int i = 0; i <= VehModel.bicycle.length; i++) {
      if (i < VehModel.bicycle.length) {
        if (VehModel.bicycle[i].vehicleOwnership.text.isEmpty) {
          return Validator.showSnack(context, " يجب إخيار ! رموز الملكية؟");
        } else if (VehModel.bicycle[i].vehicleParking.text.isEmpty) {
          return Validator.showSnack(context,
              " يجب إخيار ! عندما تكون في المنزل ، أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات .");
        }
      }
    }
    if (x > total) {
      return Validator.showSnack(
          context, " يجب إدخال كل عدد المركبات فى الأسرة");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PersonScreen(),
        ),
      );
    }
  }
}
