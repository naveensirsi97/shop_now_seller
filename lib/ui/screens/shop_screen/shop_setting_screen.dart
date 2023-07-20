import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/controller/profile_controller.dart';
import 'package:emart_seller_app/widgets/custom_textfield.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ShopSettingScreen extends StatelessWidget {
  const ShopSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          //  automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: boldText(text: shopSettings, size: 16.0),
          actions: [
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ))
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);
                      await controller.updateShop(
                        shopName: controller.shopNameController.text,
                        shopAddress: controller.shopAddressController.text,
                        shopMobile: controller.shopMobileController.text,
                        shopWebsite: controller.shopWebsiteController.text,
                        shopDesc: controller.shopDescController.text,
                      );
                      VxToast.show(context, msg: 'Shop Updated');
                    },
                    child: normalText(text: 'Save', size: 16.0),
                  )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              customTextField(
                  label: shopName,
                  hint: nameHint,
                  controller: controller.shopNameController),
              10.heightBox,
              customTextField(
                  label: address,
                  hint: shopAddressHint,
                  controller: controller.shopAddressController),
              10.heightBox,
              customTextField(
                  label: mobile,
                  hint: shopMobileHint,
                  controller: controller.shopMobileController),
              10.heightBox,
              customTextField(
                  label: webSite,
                  hint: shopWebsiteHint,
                  controller: controller.shopWebsiteController),
              10.heightBox,
              customTextField(
                  label: description,
                  hint: shopDescHint,
                  isDesc: true,
                  controller: controller.shopDescController),
            ],
          ),
        ),
      ),
    );
  }
}
