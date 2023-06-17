import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Pages/oldCityPage.dart';

class OldCityWidget extends StatefulWidget {
  @override
  State<OldCityWidget> createState() => _OldCityWidgetState();
}

class _OldCityWidgetState extends State<OldCityWidget> {
  List oldCityList = [
    {"id": 1, "image_path": 'assets/images/oldCity/old_ala.jpg'},
    {"id": 2, "image_path": 'assets/images/oldCity/old_ala1.jpg'},
    {"id": 3, "image_path": 'assets/images/oldCity/old_ala2.jpg'},
    {"id": 4, "image_path": 'assets/images/oldCity/old_ala3.jpg'},
    {"id": 5, "image_path": 'assets/images/oldCity/old_ala4.jpg'},
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (c) => OldCityPage())),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey, width: 1)),
          child: CarouselSlider(
            items: oldCityList
                .map((item) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey, width: 1),
                          image: DecorationImage(
                              image: AssetImage(item['image_path']),
                              fit: BoxFit.cover)),
                    ))
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
        ),
      ),
    ]);
  }
}
