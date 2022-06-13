// ignore_for_file: non_constant_identifier_names

import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:b2b_mobile/app/modules/home/catagories_model.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../catagories_query_mutation.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  //  final shimmerLoading = ShimmerLoading();
  final reusableWidget = ReusableWidget();

  var loading = false.obs;

  var CatagoriData = <CategoriesModel>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    loading(true);

    GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
    CatagoriesQueryMutation drugCatagoriesQueryMutation =
        CatagoriesQueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(drugCatagoriesQueryMutation.getMyCatagories(
            int.parse("10"), int.parse("1"))),
      ),
    );

    if (!result.hasException) {
      for (var i = 0; i < result.data!["categories"]["data"].length; i++) {
        CatagoriData.add(CategoriesModel(
          id: result.data!["categories"]["data"][i]["id"],
          name: result.data!["categories"]["data"][i]["name"],
          iamgelink: result.data!["categories"]["data"][i]["image"],
          brand: result.data!["categories"]["data"][i]["children"].length,
        ));

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
