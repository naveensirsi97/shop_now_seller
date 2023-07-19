import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // login method

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storeUserData({name, password, email}) async {
  //   DocumentReference store =
  //       fireStore.collection(vendorsCollection).doc(auth.currentUser!.uid);
  //   store.set({
  //     'vendor_name': null,
  //     'password': '',
  //     'email': null,
  //     'imageUrl': '',
  //     'id': auth.currentUser!.uid,
  //   });
  // }

  signOut(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  // // signup method
  // Future<UserCredential?> signupMethod({context, email, password}) async {
  //   UserCredential? userCredential;
  //   try {
  //     userCredential = await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     VxToast.show(context, msg: e.toString());
  //   }
  //   return userCredential;
  // }
  //
  // // storing data method
  //
  // storeUserData({name, password, email}) async {
  //   DocumentReference store =
  //       fireStore.collection(usersCollection).doc(auth.currentUser!.uid);
  //   store.set({
  //     'name': name,
  //     'password': password,
  //     'email': email,
  //     'imageUrl': '',
  //     'id': auth.currentUser!.uid,
  //     'cart_count': '00',
  //     'wishList_count': '00',
  //     'order_count': '00',
  //   });
  // }
}
