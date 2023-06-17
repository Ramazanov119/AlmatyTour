import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:lottie/lottie.dart';
import 'package:AlmatyTour/Widgets/TextWidget.dart';

import '../generated/locale_keys.g.dart';

class SosPage extends StatelessWidget {
  SosPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _callEmergency() async {
      const emergency = ('112');
      bool? res = await FlutterPhoneDirectCaller.callNumber(emergency);
    }

    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: TextWidget(
            text: LocaleKeys.totenshe_jagdailar_qyzmeti.tr(),
            color: Color.fromARGB(255, 255, 17, 0),
            textSize: 27,
            fontFamily: 'Ubuntu',
            isTitle: true,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _callEmergency();
              },
              child: Lottie.network(
                  'https://assets2.lottiefiles.com/packages/lf20_49au6l3p.json',
                  width: _screenWidth,
                  height: _screenWidth,
                  fit: BoxFit.fill),
            ),
          ),
        ));
  }
}
