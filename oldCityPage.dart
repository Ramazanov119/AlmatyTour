import 'package:AlmatyTour/generated/locale_keys.g.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/TextWidget.dart';
import 'btm_bar.dart';

class OldCityPage extends StatefulWidget {
  const OldCityPage({super.key});

  @override
  State<OldCityPage> createState() => _OldCityPageState();
}

class _OldCityPageState extends State<OldCityPage> {
  List oldCityList = [
    {
      "id": 1,
      "image_path": 'assets/images/oldCity/old_ala.jpg',
      'title': LocaleKeys.orta_gasyrlar.tr(),
      'history': LocaleKeys.qazirgi_almaty_aymagynda_arheologtar.tr()
    },
    {
      "id": 2,
      "image_path": 'assets/images/oldCity/old_ala1.jpg',
      'title': LocaleKeys.vernyi.tr(),
      'history': LocaleKeys.vernyi_qazirgi_almaty.tr()
    },
    {
      "id": 3,
      "image_path": 'assets/images/oldCity/old_ala2.jpg',
      'title': LocaleKeys.kenes_kezeni,
      'history': LocaleKeys.jyly_vernyida.tr()
    },
    {
      "id": 4,
      "image_path": 'assets/images/oldCity/old_ala3.jpg',
      'title': LocaleKeys.indystrialandyry.tr(),
      'history': LocaleKeys.jyldan_keiin.tr()
    },
    {
      "id": 5,
      "image_path": 'assets/images/oldCity/old_ala4.jpg',
      'title': LocaleKeys.qazirgi_zaman.tr(),
      'history': LocaleKeys.qazirgi_yaqytta_almaty.tr()
    },
  ];
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomBarScreen())),
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          title: TextWidget(
            text: LocaleKeys.qala_tarihy.tr(),
            isTitle: true,
            color: Colors.black,
            fontFamily: 'Ubuntu',
            textSize: 32,
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              for (int index = 0; index < oldCityList.length; index++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(oldCityList[index]['image_path']),
                    TextWidget(
                        text: oldCityList[index]['title'],
                        color: Colors.black,
                        textSize: 20,
                        fontFamily: 'Cormorant'),
                    TextWidget(
                        text: oldCityList[index]['history'],
                        color: Colors.black,
                        textSize: 18,
                        fontFamily: 'Cormorant'),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
            ],
          ),
        ));
  }
}
