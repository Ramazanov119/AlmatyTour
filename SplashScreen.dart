import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:AlmatyTour/Pages/auth_screen.dart';
import 'package:AlmatyTour/Pages/btm_bar.dart';
import '../generated/locale_keys.g.dart';
import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenTimer() {
    Timer(const Duration(seconds: 6), () async {
      //Если пользователь тіркелген болса
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((c) => BottomBarScreen())));
      } else //Если пользователь тіркелмеген болса
      {
        Navigator.push(
            context, MaterialPageRoute(builder: ((c) => AuthScreen())));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    SplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWith = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 550,
            height: _screenWith * 0.8,
            child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_1ezvulr6.json'),
          ),
          Text(
            "Almaty Tour",
            style: TextStyle(
                fontSize: 38,
                color: Color(0xFF42A5F5),
                fontFamily: 'Righteous'),
          ),
          Text(
            LocaleKeys.saiahatynyzdy_tek_bizben_birge_zertteniz.tr(),
            style: TextStyle(
                fontSize: 20, color: Color(0xFF42A5F5), fontFamily: 'Ubuntu'),
          ),
        ],
      )),
    );
  }
}
