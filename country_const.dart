import 'package:flutter/material.dart';

import '../Widgets/TextWidget.dart';

class CountryConst extends StatelessWidget {
  final String country, imgPath;
  final Color color;

  const CountryConst(
      {super.key,
      required this.country,
      required this.imgPath,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print('print category');
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Color.fromARGB(244, 255, 255, 255).withOpacity(0.7),
                width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: _screenWidth * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.fitWidth,
                    ))),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              text: country,
              textSize: 20,
              isTitle: true,
              color: color,
              fontFamily: 'Cormorant',
            ),
          ],
        ),
      ),
    );
  }

  //
}
