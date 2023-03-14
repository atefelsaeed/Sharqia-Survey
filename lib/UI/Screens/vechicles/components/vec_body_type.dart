import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/vechicles/components/owner_ship_code.dart';

import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import 'fuel_type_code.dart';
import 'park_this_car.dart';

class BodyTypeVehicles extends StatefulWidget {
  const BodyTypeVehicles({
    super.key,
    required this.vecBodyType,
    required this.index,
    required this.title,
    required this.function,
  });

  final VehicleBodyDetails vecBodyType;
  final int index;
  final String title;
  final Function function;

  @override
  State<BodyTypeVehicles> createState() => _BodyTypeVehiclesState();
}

class _BodyTypeVehiclesState extends State<BodyTypeVehicles> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TextGlobal(
                fontWeight: FontWeight.bold,
                text: "${widget.index.toString()} ${widget.title.toString()}",
                fontSize: height(context) * .02,
                color: ColorManager.orangeTxtColor,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    widget.function();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: ColorManager.primaryColor,
                  ))
            ],
          ),
          AppSize.spaceHeight2(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OwnerShipCode(
                textEditingController: widget.vecBodyType.vehicleOwnership,
              ),
              AppSize.spaceWidth2(context),
              widget.title == "دراجة هوائية"
                  ? Container()
                  : FuelTypeCode(
                      textEditingController: widget.vecBodyType.vehicleFuelType,
                    ),
            ],
          ),
          AppSize.spaceHeight2(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkThisCar(
                textEditingController: widget.vecBodyType.vehicleParking,
              ),
              AppSize.spaceWidth2(context),
            /*  widget.title == "شاحنة"
                  ?

              /*LargeItemCar(
                      textEditingController: widget.vecBodyType.largeItemCar,
                    )*/
              Largexx(
                textEditingController: widget.vecBodyType.largeItemCar,
              )
                  : Container()*/
            ],
          ),
          AppSize.spaceHeight1(context),
        ],
      ),
    );
  }
}
