import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Pages/lang_screen.dart';

class LangWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => LangScreen()));
          },
        ),
      ),
    );
  }
}
