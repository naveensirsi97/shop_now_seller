import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/controller/orders_controller.dart';
import 'package:emart_seller_app/services/store_services.dart';
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
    var controller = Get.put(OrdersController());
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
      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No Orders Yet!',
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
                    (index) {
                      var time = data[index]['order_date'].toDate();
                      return Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: ListTile(
                          onTap: () {
                            Get.to(() => OrdersDetails(
                                  data: data[index],
                                ));
                          },
                          // leading: const Icon(
                          //   Icons.production_quantity_limits,
                          //   size: 40,
                          // ),
                          tileColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          title: boldText(
                              text: '${data[index]['order_code']}',
                              color: purpleColor,
                              size: 16.0),
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
                                          .format(time),
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
                          trailing: boldText(
                              text: '${data[index]['total_amount']}',
                              color: purpleColor,
                              size: 16.0),
                        ),
                      );
                    },
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
