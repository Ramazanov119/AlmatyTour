import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../Widgets/TextWidget.dart';
import '../function/global_method.dart';
import '../generated/locale_keys.g.dart';

class HotelWidget extends StatefulWidget {
  const HotelWidget({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  _HotelWidgetState createState() => _HotelWidgetState();
}

class _HotelWidgetState extends State<HotelWidget> {
  String hotelName = '';
  String address = '';
  String? imageUrl;
  String price = '0.0';
  String contacts = '';

  @override
  void initState() {
    getToursData();
    super.initState();
  }

  Future<void> getToursData() async {
    try {
      final DocumentSnapshot hotelsDoc = await FirebaseFirestore.instance
          .collection('hotels')
          .doc(widget.id)
          .get();
      if (hotelsDoc == null) {
        return;
      } else {
        if (mounted) {
          setState(() {
            hotelName = hotelsDoc.get('hotelName');
            imageUrl = hotelsDoc.get('imageUrl');
            price = hotelsDoc.get('price');
            address = hotelsDoc.get('address');
            contacts = hotelsDoc.get('contacts');
          });
        }
      }
    } catch (error) {
      GlobalMethods.errorDialog(subtitle: '$error', context: context);
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.black45, width: 2)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl == null
                          ? 'assets/images/blocked_seller.png'
                          : imageUrl!),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 2,
              ),
              TextWidget(
                text: LocaleKeys.qonaq_ui_atayy.tr() + ': $hotelName',
                color: Colors.black,
                textSize: 18,
                fontFamily: 'Cormorant',
                isTitle: true,
              ),
              const SizedBox(
                width: 7,
              ),
              TextWidget(
                text: LocaleKeys.bagasy.tr() + ': $price',
                color: Colors.black,
                textSize: 14,
                fontFamily: 'Cormorant',
              ),
              const SizedBox(
                height: 2,
              ),
              TextWidget(
                text: LocaleKeys.meken_jaiy.tr() + ': $address',
                color: Colors.black,
                textSize: 14,
                fontFamily: 'Cormorant',
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                height: 32,
                width: 95,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                    onPressed: () {
                      _callPhone();
                    },
                    child: TextWidget(
                      text: LocaleKeys.bailanys.tr(),
                      color: Colors.white,
                      textSize: 14,
                      fontFamily: 'Cormorant',
                    )),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ]));
  }

  void _callPhone() async {
    String phoneNumber = ('$contacts');
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
  }
}
