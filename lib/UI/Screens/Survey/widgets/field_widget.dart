import 'package:flutter/material.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class Field extends StatelessWidget {
  const Field(
      {super.key,
      required this.peopleAdults18,
      required this.peopleUnder18,
      required this.totalNumberOfVecText,
      required this.totalNumberOfVec,
      required this.peopleAdults18Text,
      required this.function,
      required this.peopleUnder18Text,
      required this.isHome,
      required this.showDeleteIcon});

  final TextEditingController peopleAdults18;

  final TextEditingController peopleUnder18;
  final TextEditingController totalNumberOfVec;
  final String peopleAdults18Text;
  final bool isHome;
  final String peopleUnder18Text;
  final String totalNumberOfVecText;
  final Function function;
  final bool showDeleteIcon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isHome == false
        ? Column(
            children: [
              showDeleteIcon == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              function();
                            },
                            icon: Icon(
                              Icons.delete,
                              color: ColorManager.primaryColor,
                            ))
                      ],
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        MyTextForm(
                          label: "",
                          controller: peopleUnder18,
                          onTap: () {  },
                          widthForm: width(context) * .1,
                          keyboardType: TextInputType.number,
                          isNumber: true,
                        ),
                        AppSize.spaceWidth1(context),
                        Expanded(
                          flex: 1,
                          child: TextGlobal(
                            text: peopleUnder18Text,
                            fontSize: height(context) * .012,
                            color: ColorManager.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSize.spaceWidth3(context),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          MyTextForm(
                            label: "",
                            controller: peopleAdults18,
                            widthForm: width(context) * .1,
                            keyboardType: TextInputType.number,
                            isNumber: true,
                            onTap: () {  },
                          ),
                          AppSize.spaceWidth1(context),
                          Expanded(
                            flex: 1,
                            child: TextGlobal(
                              text: peopleAdults18Text,
                              fontSize: height(context) * .014,
                              color: ColorManager.grayColor,
                            ),
                          ),
                        ],
                      )),
                  AppSize.spaceWidth3(context),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        MyTextForm(
                          label: "",
                          controller: totalNumberOfVec,
                          widthForm: width(context) * .1,
                          onTap: () {  },
                          keyboardType: TextInputType.number,
                          isNumber: true,
                        ),
                        AppSize.spaceWidth1(context),
                        Expanded(
                          flex: 1,
                          child: TextGlobal(
                            text: totalNumberOfVecText,
                            fontSize: height(context) * .012,
                            color: ColorManager.grayColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        : Container();
  }
}
