import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Widget customTextField({label, hint, controller, isDesc = false}) {
  return TextFormField(
    controller: controller,
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
        isDense: true,
        label: normalText(text: label),
        // enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(12),
        //     borderSide: const BorderSide(color: Colors.white)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white)),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey)),
  );
}
