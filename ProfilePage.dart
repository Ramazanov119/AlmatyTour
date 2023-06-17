import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:AlmatyTour/Pages/forget_psw.dart';
import 'package:AlmatyTour/Pages/login_screen.dart';
import 'package:AlmatyTour/const/auth_service.dart';
import 'package:AlmatyTour/function/global.dart';
import '../generated/locale_keys.g.dart';
import 'btm_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController _addressTextController = TextEditingController();

  @override
  void dispose() {
    _addressTextController.dispose();
  }

  final AuthService authServer = new AuthService();
  String? name = sharedPreferences!.getString('name').toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => BottomBarScreen())),
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: LocaleKeys.salem.tr(),
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                      text: name != null ? LocaleKeys.paidalanyshy.tr() : name,
                      //ToDo: check NAME
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ])),
              const SizedBox(
                height: 5,
              ),
              Text(
                authServer.firebaseAuth.currentUser!.email!,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                  title: LocaleKeys.qupia_sozdi_umyttynyz_ba.tr(),
                  icon: IconlyBold.unlock,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => ForgetPasswordScreen()));
                  }),
              _listTiles(
                  title: LocaleKeys.juieden_shygy.tr(),
                  icon: IconlyBold.logout,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();

                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => LoginScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onPressed}) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle == null ? '' : subtitle),
        leading: Icon(icon),
        trailing: Icon(IconlyLight.arrowRight2),
        onTap: () {
          onPressed();
        });
  }
}
