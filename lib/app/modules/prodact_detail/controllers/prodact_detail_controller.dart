import 'dart:async';

import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:b2b_mobile/app/modules/order/order_model.dart';
import 'package:b2b_mobile/app/modules/prodact_detail/prodact_detail_model.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:b2b_mobile/constant/shimmer_loading.dart';
import 'package:b2b_mobile/models/Product.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../prodact_detail_query_mutation.dart';

class ProdactDetailController extends GetxController {
  final reusableWidget = ReusableWidget();
  var shimmerLoading = ShimmerLoading();
  var loading = false.obs;
  var selected = true.obs;
  final count = 0.obs;

  var attributes = <ProdactattributesModel>[].obs;
  List<OrderHistoryModel> orderData = [];
  var id = ''.obs;
  var name = ''.obs;

  final List<String> imagelink = [];

  var description = "".obs;
  var attributes_name = "".obs;
  var values = "".obs;
  @override
  void onInit() {
    getData();

    super.onInit();
  }

  Future<void> getData() async {
    loading(true);

    GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(
      MutationOptions(
        document: gql(ProdactDeatilQueryMutation.getMyProdactDetail),
        variables: <String, dynamic>{
          'id': int.parse(Get.arguments['product'].toString()),
        },
      ),
    );

    if (!result.hasException) {
      for (var j = 0; j < result.data!["product"]["images"].length; j++) {
        id.value = result.data!["product"]["id"];
        name.value = result.data!["product"]["name"];
        imagelink.add(result.data!["product"]["images"][j]);

        id.value = result.data!["product"]["id"];
        description.value = result.data!["product"]["description"];

        loading(false);
      }

      for (var i = 0; i < result.data!["product"]["skus"].length; i++) {
        for (var k = 0;
            k < result.data!["product"]["skus"][i]["variants"].length;
            k++) {
          attributes.add(ProdactattributesModel(
            name: result.data!["product"]["skus"][i]["name"],
            price: result.data!["product"]["skus"][i]["price"],
            attribute_name: result.data!["product"]["skus"][i]["variants"][k]
                ["attribute"]["name"],
            attributeValue: result.data!["product"]["skus"][i]["variants"][k]
                ["attributeValue"]["value"],
          ));
        }
      }
    } else {
      print(result.exception);
    }
  }

  Timer? timerDummy;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
