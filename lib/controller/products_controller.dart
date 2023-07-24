import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/controller/home_controller.dart';
import 'package:emart_seller_app/models/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductsController extends GetxController {
  var isLoading = false.obs;

  // textfield controller

  var pNameController = TextEditingController();
  var pDescController = TextEditingController();
  var pPriceController = TextEditingController();
  var pQuantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subCategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesLinks = [];
  var pImagesList = RxList<dynamic>.generate(3, (index) => null);

  var categoryValue = ''.obs;
  var subCategoryValue = ''.obs;
  var selectedColorIndex = 0.obs;

  getCategories() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  populateCategoryList() {
    categoryList.clear();

    for (var item in category) {
      categoryList.add(item.name);
    }
  }

  populateSubCategory(cat) {
    subCategoryList.clear();
    var data = category.where((element) => element.name == cat).toList();

    for (var i = 0; i < data.first.subcategory.length; i++) {
      subCategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImage(index, context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        pImagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages() async {
    pImagesLinks.clear();
    for (var item in pImagesList) {
      if (item != null) {
        var filename = basename(item.path);
        var destination = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLinks.add(n);
      }
    }
  }

  uploadProduct(context) async {
    var store = fireStore.collection(productsCollection).doc();
    await store.set({
      'is_featured': false,
      'p_category': categoryValue.value,
      'p_colors': FieldValue.arrayUnion([]),
      'p_description': pDescController.text,
      'p_imgs': FieldValue.arrayUnion(pImagesLinks),
      'p_name': pNameController.text,
      'p_price': pPriceController.text,
      'p_quantity': pQuantityController.text,
      'p_rating': "5.0",
      'p_seller': Get.find<HomeController>().userName,
      'p_wishList': FieldValue.arrayUnion([]),
      'vendor_id': "EUFGkmG2pXeMt9mPMnsSzBwBnLE3", // currentUser!.uid,
      'p_sabcategory': subCategoryValue.value,
      'featured_id': '',
    });
    isLoading(false);
    VxToast.show(context, msg: 'Product uploaded');
  }

  addFeatured(docId) async {
    await fireStore.collection(productsCollection).doc(docId).set({
      'featured_id': 'EUFGkmG2pXeMt9mPMnsSzBwBnLE3',
      'is_featured': true,
    }, SetOptions(merge: true));
  }

  removeFeatured(docId) async {
    await fireStore.collection(productsCollection).doc(docId).set({
      'featured_id': '',
      'is_featured': false,
    }, SetOptions(merge: true));
  }

  removeProduct(docId) async {
    await fireStore.collection(productsCollection).doc(docId).delete();
  }
}
