import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/font_manager.dart';

enum SystemStatus { Online, Offline }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String status = '';
  SystemStatus? _status;

  getSystemStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      status = (prefs.getString('SystemStatus') ?? '');
      if (status == 'Online') {
        _status = SystemStatus.Online;
      } else if (status == 'Offline') {
        _status = SystemStatus.Offline;
      } else {
        _status = SystemStatus.Online;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSystemStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text('الإعدادات'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text('حالة الاتصال بالانترنت'),
            Row(
              children: [
                Radio<SystemStatus>(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => ColorManager.primaryColor),
                  focusColor: ColorManager.grayColor,
                  value: SystemStatus.Online,
                  groupValue: _status,
                  onChanged: (SystemStatus? value) async {
                    final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      _status = value!;
                      debugPrint(value.toString());
                    });
                    await prefs.setString('SystemStatus', 'Online');
                  },
                ),
                Text("متصل",
                    style: TextStyle(
                        color: ColorManager.blackText,
                        fontSize: FontSize.textS20(context),
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              children: [
                Radio<SystemStatus>(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => ColorManager.primaryColor),
                  value: SystemStatus.Offline,
                  focusColor: ColorManager.grayColor,
                  groupValue: _status,
                  onChanged: (SystemStatus? value) async {
                    final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      _status = value!;
                      debugPrint(value.toString());
                    });
                    await prefs.setString('SystemStatus', 'Offline');
                  },
                ),
                Text("غير متصل",
                    style: TextStyle(
                        color: ColorManager.blackText,
                        fontSize: FontSize.textS20(context),
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
