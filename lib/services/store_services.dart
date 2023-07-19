import 'package:emart_seller_app/consts/firebase_consts.dart';

class StoreServices {
  static getProfile(uid) {
    return fireStore
        .collection(vendorsCollection)
        .where('id', isEqualTo: 'YZZmNApDdGbcYArUgxSZ')
        .get();
  }
  // static getProfile(uid) {
  //   return FirebaseFirestore.instance
  //       .collection(vendorsCollection)
  //       .doc('YZZmNApDdGbcYArUgxSZ')
  //       .snapshots();
  // }
}
