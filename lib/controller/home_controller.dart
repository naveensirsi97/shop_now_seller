import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUserName();
    super.onInit();
  }

  var navIndex = 0.obs;
  var userName = '';

  getUserName() async {
    var n = await fireStore
        .collection(vendorsCollection)
        .where("id", isEqualTo: 'YZZmNApDdGbcYArUgxSZ')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendor_name'];
      }
    });
    userName = n;
  }
}
