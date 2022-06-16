import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:b2b_mobile/app/modules/prodact_detail/prodact_detail_model.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:b2b_mobile/models/Product.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../prodact_detail_query_mutation.dart';

class ProdactDetailController extends GetxController {
  final reusableWidget = ReusableWidget();

  var loading = false.obs;
  final count = 0.obs;

  var prodactdetail = <ProdactDetailModel>[].obs;
  var id = ''.obs;
  var name = ''.obs;

  final List<String> imagelink = [];

  var description = "".obs;
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
    } else {
      print(result.exception);
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
