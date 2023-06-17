import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:AlmatyTour/Widgets/TextWidget.dart';
import 'package:AlmatyTour/models/tour_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../generated/locale_keys.g.dart';

class CategoryTours extends StatelessWidget {
  const CategoryTours({Key? key, this.isInMain = true}) : super(key: key);
  final bool isInMain;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 24) / 2;
    final double itemWidth = size.width / 2;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('tours').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 600,
            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  LocaleKeys.sizdin_bazanyz_bos,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cormorant',
                      fontSize: 20),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                LocaleKeys.birdene_durys_bolmady,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            );
          }
        }
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: TextWidget(
                text: LocaleKeys.tyrlar.tr(),
                isTitle: true,
                color: Colors.black,
                fontFamily: 'Ubuntu',
                textSize: 32,
              ),
            ),
            body: AlignedGridView.count(
                padding: EdgeInsets.all(5.0),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 13,
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length - 1 + 1,
                itemBuilder: (context, index) {
                  return TourWidget(
                    id: snapshot.data!.docs[index]['id'],
                  );
                }));
      },
    );
  }
}
