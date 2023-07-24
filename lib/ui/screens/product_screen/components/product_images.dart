import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Widget productImages({required label, onPress}) {
  return Container(
    padding: const EdgeInsets.all(8),
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: boldText(text: label, color: purpleColor, size: 16.0),
    ),
  );
}
