import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Widget ourButton({title, color = purpleColor, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: color,
          padding: const EdgeInsets.all(12)),
      onPressed: onPress,
      child: normalText(text: title, size: 16.0));
}
