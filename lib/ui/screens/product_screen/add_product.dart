import 'package:emart_seller_app/controller/products_controller.dart';
import 'package:emart_seller_app/ui/screens/product_screen/components/product_dropdown.dart';
import 'package:emart_seller_app/ui/screens/product_screen/components/product_images.dart';
import 'package:emart_seller_app/widgets/custom_textfield.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: boldText(text: 'Add Product', size: 16.0),
          actions: [
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);
                      await controller.uploadImages();
                      await controller.uploadProduct(context);
                      Get.back();
                    },
                    child: boldText(text: 'Add', size: 16.0)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                  hint: 'eg. BMW',
                  label: 'Product name',
                  controller: controller.pNameController,
                ),
                10.heightBox,
                customTextField(
                  hint: 'eg. Nice Product',
                  label: 'Description',
                  isDesc: true,
                  controller: controller.pDescController,
                ),
                10.heightBox,
                customTextField(
                    hint: 'eg. \$100',
                    label: 'Price',
                    controller: controller.pPriceController),
                10.heightBox,
                customTextField(
                    hint: 'eg. 100',
                    label: 'Quantity',
                    controller: controller.pQuantityController),
                10.heightBox,
                productDropdown('Category', controller.categoryList,
                    controller.categoryValue, controller),
                10.heightBox,
                productDropdown('SubCategory', controller.subCategoryList,
                    controller.subCategoryValue, controller),
                10.heightBox,
                const Divider(color: Colors.white),
                boldText(text: 'choose product images'),
                5.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3,
                      (index) => controller.pImagesList[index] != null
                          ? Image.file(
                              controller.pImagesList[index],
                              fit: BoxFit.cover,
                              width: 90,
                              height: 100,
                            ).onTap(() {
                              controller.pickImage(index, context);
                            })
                          : productImages(label: "${index + 1}").onTap(() {
                              controller.pickImage(index, context);
                            }),
                    ),
                  ),
                ),
                5.heightBox,
                normalText(text: 'first image will be your display image'),
                10.heightBox,
                const Divider(color: Colors.white),
                boldText(text: 'choose product colors'),
                10.heightBox,
                Obx(
                  () => Wrap(
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
                              .make()
                              .onTap(() {
                            controller.selectedColorIndex.value = index;
                          }),
                          controller.selectedColorIndex.value == index
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
