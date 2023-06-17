import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdvertisementWidget extends StatefulWidget {
  @override
  State<AdvertisementWidget> createState() => _AdvertisementWidgetState();
}

class _AdvertisementWidgetState extends State<AdvertisementWidget> {
  List advertisementList = [
    {"id": 1, "image_path": 'assets/images/advertisement/ad1.jpg'},
    {"id": 2, "image_path": 'assets/images/advertisement/ad2.jpeg'},
    {"id": 3, "image_path": 'assets/images/advertisement/ad6.jpg'},
    {"id": 4, "image_path": 'assets/images/advertisement/ad4.jpg'},
    {"id": 5, "image_path": 'assets/images/advertisement/ad5.jpg'},
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(children: [
          CarouselSlider(
            items: advertisementList
                .map((item) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
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
        ])
      ],
    );
  }
}
