import 'package:b2b_mobile/models/Product.dart';
import 'package:get/get.dart';

class ProdactDetailController extends GetxController {
  //TODO: Implement ProdactDetailController

  final count = 0.obs;

  Product product = Get.arguments['product'];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
