import 'package:emart_seller_app/controller/products_controller.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget productDropdown(
    hint, List<String> list, dropValue, ProductsController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12)),
    child: Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: normalText(text: "$hint", color: Colors.black, size: 16.0),
          value: dropValue.value == '' ? null : dropValue.value,
          isExpanded: true,
          items: list.map((e) {
            return DropdownMenuItem(value: e, child: e.toString().text.make());
          }).toList(),
          onChanged: (newValue) {
            if (hint == 'Category') {
              controller.subCategoryValue.value = '';
              controller.populateSubCategory(newValue.toString());
            }
            dropValue.value = newValue.toString();
          },
        ),
      ),
      // .box
      // .white
      // .padding(const EdgeInsets.symmetric(horizontal: 4))
      // .roundedSM
      // .make(),
    ),
  );
}
