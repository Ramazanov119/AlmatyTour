import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:AlmatyTour/const/WeatherData.dart';
import 'package:lottie/lottie.dart';

import 'btm_bar.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE d MMM, yyyy').format(dayInfo);

class WeatherPage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    // var position = await GetPosition();
    data = await client.getData('43.25', '76.95');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0x0ff081b25),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomBarScreen())),
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(children: [
          FutureBuilder(
            future: info(),
            builder: ((context, snapshot) {
              return Container(
                color: Color(0x0ff081b25),
                child: Column(children: [
                  Container(
                    height: size.height * 0.65,
                    width: size.width,
                    padding: EdgeInsets.only(top: 35),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [Color(0xff955cd1), Color(0xff3fa2fa)])),
                    child: Column(
                      children: [
                        Text(
                          '${data?.cityName}',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 32,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          dateFormat,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 18,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.network(
                          'https:${data?.icon}',
                          width: size.width * 0.3,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${data?.condition}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.temp}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                //ToDo: wrap SizedBox all lottiefiles
                                Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_qdgvz2hn.json'),
                                Text(
                                  '${data?.wind}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'jel',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Lottie.network(
                                    'https://assets6.lottiefiles.com/private_files/lf30_mdcivfgg.json'),
                                Text(
                                  '${data?.humidity} %',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'ylǵaldy',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Lottie.network(
                                    'https://assets10.lottiefiles.com/private_files/lf30_KzN6IW.json'),
                                Text(
                                  '${data?.pricipe} mm',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'qysym',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            'Gust',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.gust} kp/h',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Pressure',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.pressure} hpa',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            'UV',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.uv}',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Precipitacion',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.pricipe} mm',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            'Wind',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.wind} km/h',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ubuntu',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Last Update',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontFamily: 'Ubuntu',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data?.last_update}',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Ubuntu',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                    ],
                  )
                ]),
              );
            }),
          ),
        ]));
  }
}
