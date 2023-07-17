import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/widgets/dashboard_button.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: product,
                    count: '60',
                    icon: const Icon(
                      Icons.production_quantity_limits,
                      color: Colors.white,
                    )),
                dashboardButton(context,
                    title: order,
                    count: '10',
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
                    count: '50',
                    icon: const Icon(
                      Icons.star_rate_outlined,
                      color: Colors.white,
                      size: 32,
                    )),
                dashboardButton(
                  context,
                  title: totalSales,
                  count: '111',
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
                    9,
                    (index) => ListTile(
                      onTap: () {},
                      leading: const Icon(
                        Icons.production_quantity_limits,
                        size: 40,
                      ),
                      title: boldText(
                          text: 'Product title',
                          color: purpleColor,
                          size: 16.0),
                      subtitle: normalText(text: '\$40.0', color: Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
