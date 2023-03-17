import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/Resources/style_manager.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import 'headline_trip.dart';

class TimeLeave extends StatefulWidget {
  final TextEditingController expectedDeparture;

  const TimeLeave({
    Key? key,
    required this.expectedDeparture,
  }) : super(key: key);

  @override
  State<TimeLeave> createState() => _TimeLeaveState();
}

class _TimeLeaveState extends State<TimeLeave> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _showTimePicker() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return StyleManager.selectTime(context, child);
      },
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        widget.expectedDeparture.text = _selectedTime.format(context);
      });
    } else {
      debugPrint("Time is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlineText(text: "3. في أي وقت غادرت؟"),
        SizedBox(
          width: width(context) * 0.45,
          child: TextGlobal(
            text: "وقت المغادرة",
            fontSize: height(context) * 0.02,
            color: ColorManager.black,
          ),
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextForm(
              label: "وقت المغادرة المتوقع",
              controller: widget.expectedDeparture,
              readOnly: true,
              onTap: () => _showTimePicker(),
            ),
            AppSize.spaceWidth2(context),
          ],
        ),
      ],
    );
  }
}
