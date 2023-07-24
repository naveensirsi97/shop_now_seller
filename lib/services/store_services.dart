import 'package:emart_seller_app/consts/firebase_consts.dart';

class StoreServices {
  static getProfile(uid) {
    return fireStore
        .collection(vendorsCollection)
        .where('id', isEqualTo: 'YZZmNApDdGbcYArUgxSZ')
        .get();
    //   return FirebaseFirestore.instance
    //       .collection(vendorsCollection)
    //       .doc('YZZmNApDdGbcYArUgxSZ')
    //       .snapshots();
  }

  static getMessages(uid) {
    return fireStore
        .collection(chatsCollection)
        .where('toId', isEqualTo: 'EUFGkmG2pXeMt9mPMnsSzBwBnLE3')
        .snapshots();
  }

  static getOrders(uid) {
    return fireStore
        .collection(ordersCollection)
        .where('vendors', arrayContains: 'EUFGkmG2pXeMt9mPMnsSzBwBnLE3')
        .snapshots();
  }

  static getProducts(uid) {
    return fireStore
        .collection(productsCollection)
        .where('vendor_id', isEqualTo: 'EUFGkmG2pXeMt9mPMnsSzBwBnLE3')
        .snapshots();
  }

  // static getPopularProducts(uid) {
  //   return fireStore
  //       .collection(productsCollection)
  //       .where('vendor_id', isEqualTo: 'EUFGkmG2pXeMt9mPMnsSzBwBnLE3')
  //       .orderBy('p_wishList'.length);
  // }
}
