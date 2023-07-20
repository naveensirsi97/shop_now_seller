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
        .where('toId', isEqualTo: uid)
        .snapshots();
  }
}
