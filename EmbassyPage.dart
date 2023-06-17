import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:AlmatyTour/Widgets/TextWidget.dart';
import 'package:AlmatyTour/const/country_const.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../generated/locale_keys.g.dart';

class EmbassyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> countryInfo = [
      {
        'country': LocaleKeys.azirbaijan_el.tr(),
        'imgPath': 'assets/flags/аzerbaijan.png',
        'address': LocaleKeys.satbaev_29.tr(),
        'contacts': '87787864670'
      },
      {
        'country': LocaleKeys.ayganstan_el.tr(),
        'imgPath': 'assets/flags/afghanistan.png',
        'address': LocaleKeys.miras_sha.tr(),
        'contacts': '87272785830'
      },
      {
        'country': LocaleKeys.armenia_el.tr(),
        'imgPath': 'assets/flags/armenia.png',
        'address': LocaleKeys.seifyllin_dangyly.tr(),
        'contacts': '87077910403'
      },
      {
        'country': LocaleKeys.avstralia_el.tr(),
        'imgPath': 'assets/flags/australia.png',
        'address': LocaleKeys.al_farabi_dangyly_77.tr(),
        'contacts': '87761083090'
      },
      {
        'country': LocaleKeys.belgia_el.tr(),
        'imgPath': 'assets/flags/belgium.png',
        'address': LocaleKeys.dostyq_dangyly_138.tr(),
        'contacts': '87273561688'
      },
      {
        'country': LocaleKeys.qytai_el.tr(),
        'imgPath': 'assets/flags/china.png',
        'address': LocaleKeys.baitasov_12.tr(),
        'contacts': '87272700243'
      },
      {
        'country': LocaleKeys.estonia_el.tr(),
        'imgPath': 'assets/flags/estonia.png',
        'address': LocaleKeys.al_farabi_dangyly_120.tr(),
        'contacts': '87017770676'
      },
      {
        'country': LocaleKeys.fransia_el.tr(),
        'imgPath': 'assets/flags/france.png',
        'address': LocaleKeys.qonaev_77.tr(),
        'contacts': '87712008759'
      },
      {
        'country': LocaleKeys.germania_el.tr(),
        'imgPath': 'assets/flags/germany.png',
        'address': LocaleKeys.ivanilova_2.tr(),
        'contacts': '87272628341'
      },
      {
        'country': LocaleKeys.vengria_el.tr(),
        'imgPath': 'assets/flags/hungary.png',
        'address': LocaleKeys.musabaeva_4.tr(),
        'contacts': '87272472569'
      },
      {
        'country': LocaleKeys.undistan_el.tr(),
        'imgPath': 'assets/flags/india.png',
        'address': LocaleKeys.jarokova_362.tr(),
        'contacts': '87272696940'
      },
      {
        'country': LocaleKeys.iran_el.tr(),
        'imgPath': 'assets/flags/iran.png',
        'address': LocaleKeys.radlova_5a.tr(),
        'contacts': '87273966227'
      },
      {
        'country': LocaleKeys.italia_el.tr(),
        'imgPath': 'assets/flags/italy.png',
        'address': LocaleKeys.dostyq_dangyly_38.tr(),
        'contacts': '87272440244'
      },
      {
        'country': LocaleKeys.qyrgyzstan_el.tr(),
        'imgPath': 'assets/flags/kyrgyzstan.png',
        'address': LocaleKeys.lyganskii_koshesi_30a.tr(),
        'contacts': '87272642211'
      },
      {
        'country': LocaleKeys.mongolia_el.tr(),
        'imgPath': 'assets/flags/mongolia.png',
        'address': LocaleKeys.musabaev_1.tr(),
        'contacts': '87272472535'
      },
      {
        'country': LocaleKeys.polsha_el.tr(),
        'imgPath': 'assets/flags/poland.png',
        'address': LocaleKeys.jarkent_9.tr(),
        'contacts': '87272633768'
      },
      {
        'country': LocaleKeys.resei_el.tr(),
        'imgPath': 'assets/flags/russia.png',
        'address': LocaleKeys.jandosov_4.tr(),
        'contacts': '87089731435'
      },
      {
        'country': LocaleKeys.ontustik_koreia_el.tr(),
        'imgPath': 'assets/flags/south-korea.png',
        'address': LocaleKeys.qaldaiaqov_66.tr(),
        'contacts': '87272910490'
      },
      {
        'country': LocaleKeys.tajikstan_el.tr(),
        'imgPath': 'assets/flags/tajikistan.png',
        'address': LocaleKeys.sanatorii_16.tr(),
        'contacts': '87272697059'
      },
      {
        'country': LocaleKeys.turkia_el.tr(),
        'imgPath': 'assets/flags/turkey.png',
        'address': LocaleKeys.tole_bi_29a.tr(),
        'contacts': '87272784165'
      },
      {
        'country': LocaleKeys.amerika_qurama_shtattary.tr(),
        'imgPath': 'assets/flags/usa.png',
        'address': LocaleKeys.samal_shagynaydany_97.tr(),
        'contacts': '87272504802'
      },
      {
        'country': LocaleKeys.ozbekstan_el.tr(),
        'imgPath': 'assets/flags/uzbekistan.png',
        'address': LocaleKeys.jarokov_360.tr(),
        'contacts': '87273902616'
      },
    ];

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: TextWidget(
            text: LocaleKeys.almatydagy_konsyldyq.tr(),
            isTitle: true,
            color: Colors.black,
            fontFamily: 'Ubuntu',
            textSize: 32,
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              for (int index = 0; index < countryInfo.length; index++)
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(countryInfo[index]['imgPath']),
                          Column(
                            children: [
                              TextWidget(
                                  text: countryInfo[index]['country'],
                                  color: Colors.black,
                                  textSize: 20,
                                  fontFamily: 'Cormorant'),
                              TextWidget(
                                  text: countryInfo[index]['address'],
                                  color: Colors.black,
                                  textSize: 18,
                                  fontFamily: 'Cormorant')
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                void _callEmbassy() async {
                                  String number =
                                      countryInfo[index]['contacts'];
                                  bool? call =
                                      await FlutterPhoneDirectCaller.callNumber(
                                          number);
                                }
                              },
                              icon: Icon(Icons.phone_enabled))
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
