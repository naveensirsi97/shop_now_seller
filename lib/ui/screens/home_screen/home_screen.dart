import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/services/store_services.dart';
import 'package:emart_seller_app/ui/screens/product_screen/product_details.dart';
import 'package:emart_seller_app/widgets/dashboard_button.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: purpleColor,
        title: boldText(text: dashBoard, size: 16.0),
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
                valueColor: AlwaysStoppedAnimation(Colors.cyan),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            data = data.sortedBy((a, b) =>
                b['p_wishList'].length.compareTo(a['p_wishList'].length));

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,
                          title: product,
                          count: '${data.length}',
                          icon: const Icon(
                            Icons.production_quantity_limits,
                            color: Colors.white,
                          )),
                      dashboardButton(context,
                          title: order,
                          count: '5',
                          icon: const Icon(
                            Icons.add_alarm,
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,
                          title: rating,
                          count: '22',
                          icon: const Icon(
                            Icons.star_rate_outlined,
                            color: Colors.white,
                            size: 32,
                          )),
                      dashboardButton(
                        context,
                        title: totalSales,
                        count: '50',
                        icon: const Icon(
                          Icons.energy_savings_leaf,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  boldText(text: popular, color: purpleColor, size: 16.0),
                  20.heightBox,
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          data.length,
                          (index) => data[index]['p_wishList'].length == 0
                              ? const SizedBox()
                              : ListTile(
                                  onTap: () {
                                    Get.to(() =>
                                        ProductsDetail(data: data[index]));
                                  },
                                  leading: Image.network(
                                    data[index]['p_imgs'][0],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  title: boldText(
                                      text: '${data[index]['p_name']}',
                                      color: purpleColor,
                                      size: 16.0),
                                  subtitle: normalText(
                                      text: '${data[index]['p_price']}',
                                      color: Colors.grey),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
