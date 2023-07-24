import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/services/store_services.dart';
import 'package:emart_seller_app/ui/screens/messages_screen/chat_screen.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0),
      ),
      body: StreamBuilder(
        stream: StoreServices.getMessages(auth.currentUser!.uid),
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
                'No Messages Yet!',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(data.length, (index) {
                    var t = data[index]['created_on'] == null
                        ? DateTime.now()
                        : data[index]['created_on'].toDate();
                    var time = intl.DateFormat("h:mma").format(t);
                    return ListTile(
                      onTap: () {
                        Get.to(() => const ChatScreen());
                      },
                      leading: const CircleAvatar(
                        backgroundColor: Colors.purpleAccent,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: boldText(text: "${data[index]['sender_name']}"),
                      subtitle: normalText(text: "${data[index]['last_msg']}"),
                      trailing: normalText(text: time),
                    );
                  }),
                ),
              ),
            );
          }
        },
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: List.generate(
      //         20,
      //         (index) => ListTile(
      //           onTap: () {
      //             Get.to(() => const ChatScreen());
      //           },
      //           leading: const CircleAvatar(
      //             backgroundColor: Colors.purpleAccent,
      //             child: Icon(
      //               Icons.person,
      //               color: Colors.white,
      //             ),
      //           ),
      //           title: boldText(text: "Username"),
      //           subtitle: normalText(text: "last message..."),
      //           trailing: normalText(text: '10:30 PM'),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
