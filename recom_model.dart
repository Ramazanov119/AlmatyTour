import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../Widgets/TextWidget.dart';
import '../function/global_method.dart';
import '../generated/locale_keys.g.dart';

class RecomWidget extends StatefulWidget {
  const RecomWidget({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  _RecomWidgetState createState() => _RecomWidgetState();
}

class _RecomWidgetState extends State<RecomWidget> {
  String title = '';
  String address = '';
  String? imageUrl;
  String description = '';
  String contacts = '';
  String price = '0.0';

  @override
  void initState() {
    getRecomsData();
    super.initState();
  }

  Future<void> getRecomsData() async {
    try {
      final DocumentSnapshot recomsDoc = await FirebaseFirestore.instance
          .collection('reck')
          .doc(widget.id)
          .get();
      if (recomsDoc == null) {
        return;
      } else {
        if (mounted) {
          setState(() {
            title = recomsDoc.get('title');
            imageUrl = recomsDoc.get('imageUrl');
            description = recomsDoc.get('description');
            address = recomsDoc.get('address');
            contacts = recomsDoc.get('contacts');
            price = recomsDoc.get('price');
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
                text: LocaleKeys.atayy.tr() + ': $title',
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
                isTitle: true,
              ),
              const SizedBox(
                width: 2,
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
              TextWidget(
                text: LocaleKeys.sipattama.tr() + ': $description',
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
