import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../Providers/auth.dart';
import '../ChooseSurvey/chooseSurveyScreen.dart';
import '../Login/login_screen.dart';
import '../Splash/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> locationEnabled() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locationEnabled(),
      builder: (ctx, dataSnapshot) =>
          dataSnapshot.connectionState == ConnectionState.waiting
              ? Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircularProgressIndicator(),
                        Text("جاري التأكد من السماحيات"),
                      ],
                    ),
                  ),
                )
              : dataSnapshot.data as bool
                  ? Consumer<Auth>(
                      builder: (context, auth, child) => auth.isAuth
                          ? const ChooseSurveysScreen()
                          : FutureBuilder(
                              future: auth.tryAutoLogin(),
                              builder: (context, snapshot) =>
                                  snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? const SplashScreen()
                                      : const LoginScreen(),
                            ),
                    )
                  : Scaffold(
                      body: InkWell(
                        onTap: () => setState(() {}),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.pin_drop),
                              Text("يجب السماح بخدمة تحديد الموقع"),
                              Text(
                                "اضغط لإعادة المحاولة",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
    );
  }
}
