import 'dart:io';

import 'package:emart_seller_app/consts/colors.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/controller/profile_controller.dart';
import 'package:emart_seller_app/widgets/custom_textfield.dart';
import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatefulWidget {
  final String? userName;
  const EditProfile({super.key, this.userName});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var controller = Get.find<ProfileController>();
  @override
  void initState() {
    controller.nameController.text = widget.userName!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple,
        appBar: AppBar(
          //  automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: boldText(text: 'Edit Profile', size: 16.0),
          actions: [
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);

                      if (controller.profileImgPath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImageLink =
                            controller.snapshotData['imageUrl'];
                      }

                      if (controller.snapshotData['password'] ==
                          controller.oldPasswordController.text) {
                        await controller.changeAuthPassword(
                          email: controller.snapshotData['email'],
                          password: controller.oldPasswordController.text,
                          newPassword: controller.newPasswordController.text,
                        );

                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.newPasswordController.text,
                        );
                        VxToast.show(context, msg: 'Updated');
                      } else if (controller
                              .oldPasswordController.text.isEmptyOrNull &&
                          controller.newPasswordController.text.isEmptyOrNull) {
                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.snapshotData['password'],
                        );
                        VxToast.show(context, msg: 'Updated');
                      } else {
                        VxToast.show(context, msg: 'Some error occured');
                        controller.isLoading(false);
                      }
                    },
                    child: normalText(text: 'Save', size: 16.0),
                  )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              controller.snapshotData['imageUrl'] == '' &&
                      controller.profileImgPath.isEmpty
                  ? Image.asset(
                      'assets/images/mobile.jpg',
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.size(100, 100).roundedFull.clip(Clip.antiAlias).make()
                  : controller.snapshotData['imageUrl'] != '' &&
                          controller.profileImgPath.isEmpty
                      ? Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        )
                          .box
                          .size(100, 100)
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        )
                          .box
                          .size(100, 100)
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make(),
              // Image.asset(
              //   'assets/images/emartlogo.png',
              //   width: 100,
              //   fit: BoxFit.cover,
              // ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: normalText(text: 'Change Image', color: purpleColor)),
              10.heightBox,
              const Divider(
                color: Colors.white,
              ),
              10.heightBox,
              Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(
                      text: 'Change Name & Password', color: Colors.white)),
              20.heightBox,
              customTextField(
                  hint: nameHint,
                  label: name,
                  controller: controller.nameController),
              10.heightBox,
              customTextField(
                  label: password,
                  hint: passwordHint,
                  controller: controller.oldPasswordController),
              10.heightBox,
              customTextField(
                  label: confirmPassword,
                  hint: passwordHint,
                  controller: controller.newPasswordController),
            ],
          ),
        ),
      ),
    );
  }
}
