import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/list.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/ui/screens/product_screen/add_product.dart';
import 'package:emart_seller_app/ui/screens/product_screen/product_details.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: purpleColor,
        title: boldText(text: product, size: 16.0),
        actions: [
          Center(
            child: normalText(
                text: intl.DateFormat('EEE,MMM d,' 'yy').format(DateTime.now()),
                size: 16.0),
          ),
          10.widthBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => Card(
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ProductsDetail());
                  },
                  leading: const Icon(
                    Icons.production_quantity_limits,
                    size: 40,
                  ),
                  title: boldText(
                      text: 'Product title', color: purpleColor, size: 16.0),
                  subtitle: Row(
                    children: [
                      normalText(text: '\$40.0', color: Colors.grey),
                      10.widthBox,
                      boldText(text: "Featured", color: Colors.green)
                    ],
                  ),
                  trailing: VxPopupMenu(
                    arrowSize: 0.0,
                    menuBuilder: () => Container(
                      padding: const EdgeInsets.all(4),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: List.generate(
                          popupMenuTitles.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                popupMenuIcons[index],
                                10.widthBox,
                                normalText(
                                    text: popupMenuTitles[index],
                                    color: Colors.grey)
                              ],
                            ).onTap(() {}),
                          ),
                        ),
                      ),
                    ),
                    clickType: VxClickType.singleClick,
                    child: const Icon(Icons.more_vert_outlined),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
