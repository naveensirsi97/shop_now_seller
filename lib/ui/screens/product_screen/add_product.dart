import 'package:emart_seller_app/ui/screens/product_screen/components/product_dropdown.dart';
import 'package:emart_seller_app/ui/screens/product_screen/components/product_images.dart';
import 'package:emart_seller_app/widgets/custom_textfield.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: boldText(text: 'Add Product', size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: boldText(text: 'Add', size: 16.0)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(hint: 'eg. BMW', label: 'Product name'),
              10.heightBox,
              customTextField(
                  hint: 'eg. Nice Product', label: 'Description', isDesc: true),
              10.heightBox,
              customTextField(hint: 'eg. \$100', label: 'Price'),
              10.heightBox,
              customTextField(hint: 'eg. 100', label: 'Quantity'),
              10.heightBox,
              productDropdown(title: 'Select Category'),
              10.heightBox,
              productDropdown(title: 'Select SubCategory'),
              10.heightBox,
              const Divider(color: Colors.white),
              boldText(text: 'choose product images'),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => productImages(label: "${index + 1}"),
                ),
              ),
              5.heightBox,
              normalText(text: 'first image will be your display image'),
              10.heightBox,
              const Divider(color: Colors.white),
              boldText(text: 'choose product colors'),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  9,
                  (index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      VxBox()
                          .color(Vx.randomPrimaryColor)
                          .roundedFull
                          .size(40, 40)
                          .make(),
                      const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
