import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  var orders = [];

  var confirmed = false.obs;
  var onDelivery = false.obs;
  var delivered = false.obs;
  getOrders(data) {
    orders.clear();
    for (var item in data['orders']) {
      if (item['vendor_id'] == 'EUFGkmG2pXeMt9mPMnsSzBwBnLE3') {
        orders.add(item);
      }
    }
  }

  changeStatus({title, status, docID}) async {
    var store = fireStore.collection(ordersCollection).doc(docID);
    await store.set({title: status}, SetOptions(merge: true));
  }
}
