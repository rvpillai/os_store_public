import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:os_store/config/theme/app_sizes.dart';
import 'package:os_store/config/theme/styles.dart';
import 'package:os_store/view/screens/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: containerBGDecoration,
        child: AnimatedSplashScreen(
            duration: 3000,
            splashIconSize: AppSizes().splashIconSize,
            splash: 'assets/images/splash_logo.png',
            nextScreen: const HomePage(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.transparent),
      ),
    );
  }
}
