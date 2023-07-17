import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/ui/screens/home_screen/home.dart';
import 'package:emart_seller_app/widgets/our_buttton.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              normalText(text: welcome, size: 16.0),
              10.heightBox,
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/emartlogo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  20.widthBox,
                  boldText(
                    text: appName,
                    size: 20.0,
                  ),
                ],
              ),
              40.heightBox,
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.purple,
                        ),
                        border: InputBorder.none,
                        hintText: emailHint,
                      ),
                    ),
                    5.heightBox,
                    TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.black12,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                        border: InputBorder.none,
                        hintText: passwordHint,
                      ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: normalText(
                              text: forgotPassword,
                              color: purpleColor,
                              size: 14.0)),
                    ),
                    10.heightBox,
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: ourButton(
                        title: login,
                        onPress: () {
                          Get.to(() => const Home());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Center(
                child: normalText(
                    text: anyProblem, size: 14.0, color: Colors.grey),
              ),
              const Spacer(),
              Center(
                child: boldText(text: credit, size: 14.0),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
