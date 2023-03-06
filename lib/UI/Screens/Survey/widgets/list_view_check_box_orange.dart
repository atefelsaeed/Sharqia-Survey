import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class ListViewCheckBoxOrange extends StatefulWidget {
  final String title;
  final String subTitle;
  List<dynamic> question;
  late Function onChange;
  late Map map;
  bool? isListView;

  ListViewCheckBoxOrange({
    super.key,
    required this.title,
    required this.question,
    required this.subTitle,
    this.isListView,
    required this.map,
    required this.onChange,
  });

  @override
  State<ListViewCheckBoxOrange> createState() => _ListViewCheckBoxOrangeState();
}

class _ListViewCheckBoxOrangeState extends State<ListViewCheckBoxOrange> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        HeadlineText(text: widget.title),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: widget.subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
        widget.isListView == true
            ? Container()
            : Icon(
                Icons.west_sharp,
                color: ColorManager.primaryColor,
              ),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
              height: height(context) * .04,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.question.length,
                itemBuilder: (BuildContext context, int index) =>
                    Row(children: [
                  Checkbox(
                      side: BorderSide(
                        color: ColorManager.orangeTxtColor,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      checkColor: ColorManager.whiteColor,
                      focusColor: ColorManager.orangeTxtColor,
                      activeColor: ColorManager.orangeTxtColor,
                      value: widget.question[index]["isChick"],
                      onChanged: (bool? value) {
                        for(int i=0;i<widget.question.length;i++){
                          widget.question[i]["isChick"]=false;
                        }
                        setState(() {
                          widget.question[chosenIndex]["isChick"] = false;
                          chosenIndex = index;
                          widget.question[index]["isChick"] = value;
                        });
                        widget.map["index"] = chosenIndex;
                        debugPrint(widget.question[index]["value"]);
                        widget.onChange(ChangeBoxResponse(
                            val: widget.question[index]["value"],
                            check: widget.question[index]["isChick"]));
                        //  widget.onChange(widget.question[index]["value"]);
                      }),
                  TextGlobal(
                    text: widget.question[index]["value"],
                    fontSize: height(context) * .02,
                    color: ColorManager.grayColor,
                  ),
                ]),
              )),
        ),
        widget.isListView == true
            ? Container()
            : RotatedBox(
                quarterTurns: 90,
                child: Icon(
                  Icons.west_sharp,
                  color: ColorManager.primaryColor,
                )),
      ],
    );
  }
}

class ListViewCheckBoxOrange2 extends StatefulWidget {
  final String title;
  final String subTitle;
  List<dynamic> question;
  late Function onChange;
  late Map map;
  bool? isListView;

  ListViewCheckBoxOrange2({
    super.key,
    required this.title,
    required this.question,
    required this.subTitle,
    this.isListView,
    required this.map,
    required this.onChange,
  });

  @override
  State<ListViewCheckBoxOrange2> createState() =>
      _ListViewCheckBoxOrangeState2();
}

class _ListViewCheckBoxOrangeState2 extends State<ListViewCheckBoxOrange2> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: widget.title,
                fontSize: height(context) * .02,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
        AppSize.spaceHeight05(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextGlobal(
                text: widget.subTitle,
                fontSize: height(context) * .013,
                color: ColorManager.grayColor,
              ),
            ),
          ],
        ),
        widget.isListView == true
            ? Container()
            : Icon(
                Icons.west_sharp,
                color: ColorManager.primaryColor,
              ),
        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
              height: height(context) * .04,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.question.length,
                itemBuilder: (BuildContext context, int index) =>
                    Row(children: [
                  Checkbox(
                      side: BorderSide(
                        color: ColorManager.orangeTxtColor,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      checkColor: ColorManager.whiteColor,
                      focusColor: ColorManager.orangeTxtColor,
                      activeColor: ColorManager.orangeTxtColor,
                      value: widget.question[index]["isChick"],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.question[index]["isChick"] = value;
                        });

                        widget.onChange(ChangeBoxResponse(
                            val: widget.question[index]["value"],
                            check: widget.question[index]["isChick"]));
                      }),
                  TextGlobal(
                    text: widget.question[index]["value"],
                    fontSize: height(context) * .02,
                    color: ColorManager.grayColor,
                  ),
                ]),
              )),
        ),
        widget.isListView == true
            ? Container()
            : RotatedBox(
                quarterTurns: 90,
                child: Icon(
                  Icons.west_sharp,
                  color: ColorManager.primaryColor,
                )),
      ],
    );
  }
}

class ChangeBoxResponse {
  late String val;
  late bool check;

  ChangeBoxResponse({required this.check, required this.val});
}
