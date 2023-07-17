import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/controller/home_controller.dart';
import 'package:emart_seller_app/ui/screens/home_screen/home_screen.dart';
import 'package:emart_seller_app/ui/screens/order_screen/orders_screen.dart';
import 'package:emart_seller_app/ui/screens/product_screen/products_screen.dart';
import 'package:emart_seller_app/ui/screens/profile_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreen = [
      const HomeScreen(),
      const ProductsScreen(),
      const OrdersScreen(),
      const SettingScreen()
    ];

    var bottomNavBar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: dashBoard),
      const BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits), label: product),
      const BottomNavigationBarItem(
          icon: Icon(Icons.add_alarm_sharp), label: order),
      const BottomNavigationBarItem(icon: Icon(Icons.settings), label: setting)
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: bottomNavBar,
        ),
      ),
      // appBar: AppBar(
      //   title: boldText(text: dashBoard,size: 18.0),
      // ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navScreen.elementAt(controller.navIndex.value),
            ),
          ),
        ],
      ),
    );
  }
}
