import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/Home/homeScreen.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/colors.dart';
import '../../../Resources/sizes.dart';

class SplashView extends StatefulWidget {
  const  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.homeBackground),
              fit: BoxFit.fill),
        ),
        child: SizedBox(
          width: width(context),
          height: height(context),
          child: Center(
              child: Image(
            image: const AssetImage(
              ImageAssets.splashLogo,
            ),
            width: width(context) * .9,
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
