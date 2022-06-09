import 'dart:async';

import 'package:b2b_mobile/app/modules/order/order_model.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  //TODO: Implement OrderController

  final count = 0.obs;

  final reusableWidget = ReusableWidget();
  var loading = true.obs;

  Timer? timerDummy;

  List<OrderHistoryModel> orderData = [];

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  void _getData() {
    // this timer function is just for demo, so after 1 second, the shimmer loading will disappear and show the content
    timerDummy = Timer(Duration(seconds: 1), () {
      loading.value = false;
    });

    orderData = [
      OrderHistoryModel(
          id: 1,
          name: "Shampoo - Addis ababa",
          countItem: 2,
          date: "Feb 10, 2020",
          time: "11:48"),
      OrderHistoryModel(
          id: 2,
          name: "Biscuits - Addis ababa",
          countItem: 6,
          date: "Feb 8, 2020",
          time: "13:33"),
      OrderHistoryModel(
          id: 3,
          name: "Cookies - Addis ababa",
          countItem: 3,
          date: "Feb 7, 2020",
          time: "07:27"),
    ];
  }

  @override
  void dispose() {
    timerDummy?.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
