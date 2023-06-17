import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:AlmatyTour/Pages/SplashScreen.dart';
import 'package:AlmatyTour/Pages/auth_screen.dart';
import 'package:AlmatyTour/Widgets/TextWidget.dart';

import '../const/auth_service.dart';
import '../generated/locale_keys.g.dart';
import 'btm_bar.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  saveInformationToDatabase() async {}

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                width: _screenWidth * 0.5,
                height: _screenWidth * 0.5,
                child: Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_gQhRbo.json'),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: _screenWidth,
                child: ElevatedButton(
                  child: TextWidget(
                    text: LocaleKeys.rastay.tr(),
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    isTitle: true,
                    textSize: 20,
                  ),
                  onPressed: () async {
                    if (emailController.text == "" ||
                        passwordController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            LocaleKeys.barlyq_oristerdi_toltyry_qajet.tr()),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      User? result = await AuthService()
                          .login(emailController.text, passwordController.text);
                      if (result != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBarScreen()));
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                child: TextWidget(
                  text: 'Júıege tirkelý',
                  textSize: 18,
                  fontFamily: 'Ubuntu',
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
