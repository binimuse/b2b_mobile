import 'dart:async';

import 'package:b2b_mobile/app/modules/searchpage/Model/restaurant_model.dart';
import 'package:b2b_mobile/app/modules/searchpage/Model/search_restaurant_model.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchpageController extends GetxController {
  //TODO: Implement SearchpageController

  final reusableWidget = ReusableWidget();

  var loading = false.obs;
  var loadingnew = false.obs;
  Timer? timerDummy;

  List<SearchRestaurantModel> searchData = [];
  List<RestaurantModel> restaurantData = [];

  TextEditingController etSearch = TextEditingController();
  var loadData = false.obs;

  @override
  void dispose() {
    timerDummy?.cancel();
    etSearch.dispose();
    super.dispose();
  }

  void _getData() {
    searchData = [
      SearchRestaurantModel(id: 1, words: 'Snickers'),
      SearchRestaurantModel(id: 2, words: 'oil'),
      SearchRestaurantModel(id: 3, words: 'Laundry detergent'),
      SearchRestaurantModel(id: 4, words: 'Shampoo'),
    ];
  }

  void getRestaurantData() {
    loading.value = true;
    loadData.value = true;

    timerDummy = Timer(Duration(seconds: 1), () {
      loading.value = false;

      // this timer function is just for demo, so after 1 second, the shimmer loading will disappear and show the content
    });

    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    restaurantData = [
      RestaurantModel(
          id: 1,
          name: "Snickers",
          tag: "Chicken, Rice",
          image: "assets/images/snickers1.png",
          rating: 4.9,
          phone: "2500",
          distance: 0.4,
          promo: '50% Off | Get Gift Voucher If You Buy 4 pcs',
          location: "Crown Street"),
      RestaurantModel(
          id: 2,
          name: "Snickers 2",
          tag: "Beef, Yakiniku, Japanese Food",
          image: "assets/images/snickers2.png",
          rating: 5,
          phone: "2500",
          distance: 0.6,
          promo: 'Buy 1 Get 1',
          location: "Montgomery Street"),
    ];
  }

  final count = 0.obs;
  @override
  void onInit() {
    _getData();
    loadingnew(true);
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
