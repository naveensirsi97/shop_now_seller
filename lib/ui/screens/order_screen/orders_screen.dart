import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/ui/screens/order_screen/orders_details.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: purpleColor,
        title: boldText(text: order, size: 16.0),
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
              (index) => Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const OrdersDetails());
                  },
                  // leading: const Icon(
                  //   Icons.production_quantity_limits,
                  //   size: 40,
                  // ),
                  tileColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: boldText(
                      text: '12345678', color: purpleColor, size: 16.0),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.black54,
                            size: 20,
                          ),
                          8.widthBox,
                          boldText(
                              text: intl.DateFormat()
                                  .add_yMd()
                                  .format(DateTime.now()),
                              color: Colors.black54),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.payment,
                            color: Colors.teal,
                            size: 20,
                          ),
                          8.widthBox,
                          boldText(text: unpaid, color: Colors.red),
                        ],
                      ),
                    ],
                  ),
                  trailing:
                      boldText(text: '\$50.0', color: purpleColor, size: 16.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
