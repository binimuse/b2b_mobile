import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController

  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  var loading = false.obs;
  var remember = false.obs;

  var errors = <String>[].obs;
  void addError({String? error}) {
    if (!errors.contains(error)) errors.add(error!);
  }

  void removeError({String? error}) {
    if (errors.contains(error)) errors.remove(error);
  }

  final count = 0.obs;
  @override
  void onInit() {
    loading(true);
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
