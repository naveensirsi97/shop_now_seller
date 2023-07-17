import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/ui/screens/order_screen/components/order_place_details.dart';
import 'package:emart_seller_app/widgets/our_buttton.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: boldText(text: 'Order details', size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ourButton(
            color: purpleColor, onPress: () {}, title: 'Confirm Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // order delivery status
              Visibility(
                //   visible: false,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                      ),
                    ],
                    //  borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(
                          text: 'Order Status',
                          color: Colors.black,
                          size: 16.0),
                      SwitchListTile(
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: 'Placed', color: purpleColor),
                      ),
                      SwitchListTile(
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: 'Confirmed', color: purpleColor),
                      ),
                      SwitchListTile(
                        value: false,
                        onChanged: (value) {},
                        title:
                            boldText(text: 'On Delivery', color: purpleColor),
                      ),
                      SwitchListTile(
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: 'Delivered', color: purpleColor),
                      ),
                    ],
                  ),
                ),
              ),

              //order detail section
              //const Divider(),
              20.heightBox,
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                    ),
                  ],
                  //   borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    orderPlaceDetails(
                        title1: "Order Code",
                        d1: "{data?['order_code']}",
                        title2: 'Shipping Method',
                        d2: "{data?['shipping_method']}"),
                    orderPlaceDetails(
                      title1: "Order Date",
                      d1: '12:00 PM',
                      // intl.DateFormat()
                      //     .add_yMd()
                      //     .format((data['order_date'].toDate())),
                      title2: 'Payment Method',
                      d2: "{data?['payment_method']}",
                    ),
                    orderPlaceDetails(
                      title1: "Payment Status",
                      d1: 'Unpaid',
                      title2: 'Delivery Status',
                      d2: 'Order Placed',
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Address',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "{data?['order_by_name']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Text(
                                "{data?['order_by_email']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Text(
                                "{data?['order_by_address']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Text(
                                "{data?['order_by_city']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Text(
                                "{data?['order_by_state']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Text(
                                "{data?['order_by_phone']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Text(
                                "{data?['order_by_postalCode']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Amount',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "{data?['total_amount']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //   const Divider(),

              10.heightBox,
              const Center(
                child: Text(
                  'Ordered Product',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              10.heightBox,
              Container(
                //  margin: EdgeInsets.only(bottom: 22),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                  ),
                ]),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(3, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                          title1: "{data['orders'][index]['title']}",
                          title2: "{data['orders'][index]['tPrice']}",
                          d1: "{data['orders'][index]['qty']}x",
                          d2: 'Refundable',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                ),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
