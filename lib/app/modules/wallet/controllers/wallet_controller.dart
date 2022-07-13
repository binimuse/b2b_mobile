import 'dart:io';

import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../main.dart';
import '../depositedata_model.dart';
import '../wallet_mutation.dart';

class WalletController extends GetxController {
  var loadingnew = false.obs;
  final GlobalKey<FormState> depositeform = GlobalKey<FormState>();
  final reusableWidget = ReusableWidget();
  var deposietData = <DeposteModel>[].obs;
  var selectedImagePath = ''.obs;
  var images = <File>[].obs;
  var updatepro = false.obs;
  var loadingappdata = false.obs;
  final count = 0.obs;
  late TextEditingController amount, transaction;

  @override
  void onInit() {
    loadingnew(true);
    getDepositeHistory();
    amount = TextEditingController();
    transaction = TextEditingController();
    super.onInit();
  }

  Future<void> getDepositeHistory() async {
    loadingappdata(true);

    GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
    AppDataMutation appDataMutation = AppDataMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(appDataMutation.getAppData()),
      ),
    );

    if (!result.hasException) {
      for (var i = 0; i < result.data!["depositWithSlipHistory"].length; i++) {
        deposietData.add(DeposteModel(
          id: result.data!["depositWithSlipHistory"][i]["name"],
          reference_number: result.data!["depositWithSlipHistory"][i]
              ["reference_number"],
          amount: result.data!["depositWithSlipHistory"][i]["amount"],
          confirmed_at: result.data!["depositWithSlipHistory"][i]
              ["confirmed_at"],
        ));
      }
      loadingappdata(false);
    } else {
      print(result.exception);
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please provide transaction refrence number";
    }
    return null;
  }

  String? validatamount(String value) {
    if (value.isEmpty) {
      return "Please provide amount";
    }
    return null;
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      images.add(File(selectedImagePath.value));
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  deposite() async {
    updatepro(true);
    var byteData = File(selectedImagePath.value).readAsBytesSync();

    var multipartFile = http.MultipartFile.fromBytes(
      'photo',
      byteData,
      filename: '${DateTime.now().second}.jpg',
      contentType: MediaType("image", "jpg"),
    );
    var onePointOne = double.parse(amount.text);
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(
      MutationOptions(
        document: gql(DepositeQueryMutation.deposite),
        variables: <String, dynamic>{
          'amount': onePointOne,
          'reference_number': transaction.text,
          'slip': multipartFile,
        },
      ),
    );

    if (!result.hasException) {
      updatepro(false);
      Get.defaultDialog(
          middleText: "Successfully deposited",
          backgroundColor: kPrimaryColor,
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30);

      update();
      //  getDepositeHistory();
    } else {
      updatepro(false);

      Get.defaultDialog(
          middleText: "Not deposited",
          backgroundColor: Colors.red,
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
