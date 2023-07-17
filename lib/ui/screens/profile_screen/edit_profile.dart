import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/widgets/custom_textfield.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        //  automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: boldText(text: 'Edit Profile', size: 16.0),
        actions: [
          TextButton(
            onPressed: () {},
            child: normalText(text: 'Save', size: 16.0),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/emartlogo.png',
              width: 100,
              fit: BoxFit.cover,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: normalText(text: 'Change Image', color: purpleColor)),
            10.heightBox,
            const Divider(
              color: Colors.white,
            ),
            customTextField(hint: nameHint, label: name),
            10.heightBox,
            customTextField(label: password, hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPassword, hint: passwordHint),
          ],
        ),
      ),
    );
  }
}
