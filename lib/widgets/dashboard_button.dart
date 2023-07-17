import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Widget dashboardButton(context, {title, count, icon}) {
  return Container(
    padding: const EdgeInsets.all(8),
    height: 60,
    width: MediaQuery.of(context).size.width * 0.4,
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            normalText(text: title, size: 16.0),
            boldText(text: count, size: 20.0),
          ],
        )),
        icon, // like images
        // Image.asset(
        //   'I',
        //   width: 40,
        // ),
      ],
    ),
  );
}
