import 'package:get/get.dart';

class SplashController extends GetxController {
  var loading = false.obs;
  var currentPage = 0.obs;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to B2B, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround Ethiopia",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loading(true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
