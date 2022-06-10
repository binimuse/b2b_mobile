import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  var loading = false.obs;
  var currentPage = 0.obs;
  var acc;
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
    checkIfLogin();
    super.onInit();
    loading(true);
  }

  void checkIfLogin() async {
    final prefs = await SharedPreferences.getInstance();

    acc = prefs.getString('access_token');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
