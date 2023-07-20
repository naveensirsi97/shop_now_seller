import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/consts/list.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/controller/auth_controller.dart';
import 'package:emart_seller_app/controller/profile_controller.dart';
import 'package:emart_seller_app/services/store_services.dart';
import 'package:emart_seller_app/ui/screens/login_screen.dart';
import 'package:emart_seller_app/ui/screens/messages_screen/messages_screen.dart';
import 'package:emart_seller_app/ui/screens/profile_screen/edit_profile.dart';
import 'package:emart_seller_app/ui/screens/shop_screen/shop_setting_screen.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: boldText(text: setting, size: 16.0),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => EditProfile(
                    userName: controller.snapshotData['vendor_name'],
                  ));
            },
            icon: const Icon(Icons.edit),
          ),
          TextButton(
            onPressed: () async {
              await Get.find<AuthController>().signOut(context);
              Get.offAll(() => const LoginScreen());
            },
            child: normalText(text: logout, size: 16.0),
          )
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(auth.currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
              ),
            );
          } else {
            controller.snapshotData = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading: controller.snapshotData['imageUrl'] == ''
                      ? Image.asset(
                          'assets/images/mobile.jpg',
                          width: 60,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 60,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
                  // leading: Image.asset(
                  //   'assets/images/emartlogo.png',
                  //   fit: BoxFit.cover,
                  // ).box.roundedFull.clip(Clip.antiAlias).make(),
                  title: boldText(
                      text: "${controller.snapshotData['vendor_name']}"),
                  subtitle:
                      normalText(text: "${controller.snapshotData['email']}"),
                ),
                const Divider(),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                      profileButtonsTitles.length,
                      (index) => ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(() => const ShopSettingScreen());
                              break;
                            case 1:
                              Get.to(() => const MessagesScreen());
                              break;
                          }
                        },
                        leading: Icon(
                          profileButtonIcons[index],
                          color: Colors.white,
                        ),
                        title: normalText(text: profileButtonsTitles[index]),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

// body: Column(
//   children: [
//     ListTile(
//       leading: Image.asset(
//         'assets/images/emartlogo.png',
//         fit: BoxFit.cover,
//       ).box.roundedFull.clip(Clip.antiAlias).make(),
//       title: boldText(text: 'Vendor Name'),
//       subtitle: normalText(text: 'vendoremail@gmail.com'),
//     ),
//     const Divider(),
//     10.heightBox,
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: List.generate(
//             profileButtonsTitles.length,
//             (index) => ListTile(
//                   onTap: () {
//                     switch (index) {
//                       case 0:
//                         Get.to(() => const ShopSettingScreen());
//                         break;
//                       case 1:
//                         Get.to(() => const MessagesScreen());
//                         break;
//                     }
//                   },
//                   leading: Icon(
//                     profileButtonIcons[index],
//                     color: Colors.white,
//                   ),
//                   title: normalText(text: profileButtonsTitles[index]),
//                 )),
//       ),
//     )
//   ],
// ),
