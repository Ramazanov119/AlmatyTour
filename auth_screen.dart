import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:AlmatyTour/Widgets/TextWidget.dart';
import 'package:AlmatyTour/const/auth_service.dart';
import 'package:AlmatyTour/function/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/locale_keys.g.dart';
import 'btm_bar.dart';
import 'forget_psw.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: _screenWidth * 0.5,
                height: _screenWidth * 0.5,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_ntdmh9RIUC.json'),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.sizdin_atynyz.tr(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
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
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.qupia_sozdi_rastanyz.tr(),
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
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(LocaleKeys.qupia_sozder_birdei_emes.tr()),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      User? result = await AuthService().register(
                          emailController.text, passwordController.text);
                      if (result != null) {
                        saveInfoToFirestore(User currentUser) async {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(currentUser.uid)
                              .set({
                            'uid': currentUser.uid,
                            'email': currentUser.email,
                            'name': nameController.text.trim(),
                            'status': 'approved',
                            'userCard': ['initialValue']
                          });

                          sharedPreferences =
                              await SharedPreferences.getInstance();
                          await sharedPreferences!
                              .setString('uid', currentUser.uid);
                          await sharedPreferences!
                              .setString('email', currentUser.email!);
                          await sharedPreferences!
                              .setString('name', nameController.text.trim());
                          await sharedPreferences!
                              .setString('status', 'approved');
                          await sharedPreferences!
                              .setStringList('userCard', ['initialValue']);
                        }

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
              Container(
                height: 50,
                width: _screenWidth,
                decoration: BoxDecoration(
                    //ToDo: draw black border
                    ),
                child: ElevatedButton(
                  onPressed: () {
                    AuthService().signInWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => BottomBarScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Image.asset(
                          'assets/icons/google_logo.png',
                          width: 30,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      TextWidget(
                        text: 'Google account',
                        color: Colors.white,
                        textSize: 20,
                        fontFamily: 'Ubuntu',
                        isTitle: true,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                child: TextWidget(
                  text: LocaleKeys
                      .sizde_eseptik_jazba_bar_ma_munda_juiege_kiriniz
                      .tr(),
                  textSize: 18,
                  fontFamily: 'Ubuntu',
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                child: TextWidget(
                  text: LocaleKeys.qupia_sozdi_umyttynyz_ba.tr(),
                  textSize: 18,
                  fontFamily: 'Ubuntu',
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => ForgetPasswordScreen()));
                  //ToDo request password
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
