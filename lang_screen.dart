import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/TextWidget.dart';
import '../generated/locale_keys.g.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextWidget(
          text: 'Tildi tańdańyz',
          isTitle: true,
          color: Colors.black,
          fontFamily: 'Ubuntu',
          textSize: 32,
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale('ru'));
              Navigator.pop(context);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/flags/russia.png')),
                  TextWidget(
                      text: LocaleKeys.orys_tili.tr(),
                      color: Colors.black,
                      textSize: 20,
                      fontFamily: 'Cormorant')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale('en'));
              Navigator.pop(context);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/flags/usa.png')),
                  TextWidget(
                      text: LocaleKeys.agylshyn_tili.tr(),
                      color: Colors.black,
                      textSize: 20,
                      fontFamily: 'Cormorant')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale('kk'));
              Navigator.pop(context);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/flags/kaz.png')),
                  TextWidget(
                      text: LocaleKeys.qazaq_tili.tr(),
                      color: Colors.black,
                      textSize: 20,
                      fontFamily: 'Cormorant')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
