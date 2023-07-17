import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/ui/screens/messages_screen/chat_screen.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
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
                title: boldText(text: "Username"),
                subtitle: normalText(text: "last message..."),
                trailing: normalText(text: '10:30 PM'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
