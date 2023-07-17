import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/widgets/custom_textfield.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ShopSettingScreen extends StatelessWidget {
  const ShopSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        //  automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: boldText(text: shopSettings, size: 16.0),
        actions: [
          TextButton(
            onPressed: () {},
            child: normalText(text: 'Save', size: 16.0),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(label: shopName, hint: nameHint),
            10.heightBox,
            customTextField(label: address, hint: shopAddressHint),
            10.heightBox,
            customTextField(label: mobile, hint: shopMobileHint),
            10.heightBox,
            customTextField(label: webSite, hint: shopWebsiteHint),
            10.heightBox,
            customTextField(
                label: description, hint: shopDescHint, isDesc: true),
          ],
        ),
      ),
    );
  }
}
