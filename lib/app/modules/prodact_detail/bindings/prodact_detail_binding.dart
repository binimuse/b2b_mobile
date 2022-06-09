import 'package:get/get.dart';

import '../controllers/prodact_detail_controller.dart';

class ProdactDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdactDetailController>(
      () => ProdactDetailController(),
    );
  }
}
