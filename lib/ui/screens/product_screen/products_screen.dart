import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/consts/list.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/controller/products_controller.dart';
import 'package:emart_seller_app/services/store_services.dart';
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
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () async {
          await controller.getCategories();
          controller.populateCategoryList();

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
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No Orders',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProductsDetail(data: data[index]));
                        },
                        leading: Image.network(
                          data[index]['p_imgs'][0],
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                            text: '${data[index]['p_name']}',
                            color: purpleColor,
                            size: 16.0),
                        subtitle: Row(
                          children: [
                            normalText(
                                text: '\$${data[index]['p_price']}',
                                color: Colors.grey),
                            10.widthBox,
                            boldText(
                                text: data[index]['is_featured'] == true
                                    ? "Featured"
                                    : '',
                                color: Colors.green)
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
                                (i) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        popupMenuIcons[i],
                                        color: data[index]['featured_id'] ==
                                                    'EUFGkmG2pXeMt9mPMnsSzBwBnLE3' &&
                                                i == 0
                                            ? Colors.green
                                            : Colors.black26,
                                      ),
                                      10.widthBox,
                                      normalText(
                                          text: data[index]['featured_id'] ==
                                                      'EUFGkmG2pXeMt9mPMnsSzBwBnLE3' &&
                                                  i == 0
                                              ? 'Remove feature'
                                              : popupMenuTitles[i],
                                          color: Colors.grey)
                                    ],
                                  ).onTap(() {
                                    switch (i) {
                                      case 0:
                                        if (data[index]['is_featured'] ==
                                            true) {
                                          controller
                                              .removeFeatured(data[index].id);
                                          VxToast.show(context, msg: 'Removed');
                                        } else {
                                          controller
                                              .addFeatured(data[index].id);
                                          VxToast.show(context, msg: 'Added');
                                        }
                                        break;
                                      case 1:
                                        break;
                                      case 2:
                                        controller
                                            .removeProduct(data[index].id);
                                        VxToast.show(context,
                                            msg: 'Product Removed');
                                        break;
                                      default:
                                    }
                                  }),
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
            );
          }
        },
      ),
    );
  }
}
