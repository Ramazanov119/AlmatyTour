import 'package:AlmatyTour/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:AlmatyTour/Widgets/AdvertisementWidget.dart';
import 'package:AlmatyTour/Widgets/LocationWidget.dart';
import 'package:AlmatyTour/Widgets/lang_widget.dart';
import 'package:AlmatyTour/Widgets/WeatherWidget.dart';
import '../Widgets/old_city_widget.dart';
import '../Widgets/top_locat_widget.dart';
import 'ProfilePage.dart';
import 'SosPage.dart';
import 'package:AlmatyTour/models/tour_model.dart';
import 'package:AlmatyTour/Pages/HotelPage.dart';
import 'package:AlmatyTour/Pages/TourPage.dart';
import 'package:AlmatyTour/Widgets/TextWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const WeatherWidget(),
                    const LocationWidget(),
                    LangWidget(),
                  ],
                ),
                TextWidget(
                  text: LocaleKeys.jarnama.tr(),
                  textSize: 26,
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                  isTitle: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                AdvertisementWidget(),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: LocaleKeys.qala_tarihy.tr(),
                  color: Colors.black,
                  textSize: 26,
                  fontFamily: 'Ubuntu',
                  isTitle: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                OldCityWidget(),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: LocaleKeys.usynystar.tr(),
                  color: Colors.black,
                  textSize: 26,
                  fontFamily: 'Ubuntu',
                  isTitle: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TopLocatWidget(),
              ],
            )),
      ),
    );
  }
}
