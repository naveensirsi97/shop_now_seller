import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Widget productDropdown({title}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: normalText(text: title, color: Colors.purple, size: 16.0),
        value: null,
        isExpanded: true,
        items: [],
        onChanged: (value) {},
      ),
    ),
  );
}
