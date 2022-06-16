// ignore_for_file: non_constant_identifier_names

import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:b2b_mobile/app/modules/home/catagories_model.dart';
import 'package:b2b_mobile/app/modules/home/product_query_mutation.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../catagories_query_mutation.dart';
import '../product_model.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  //  final shimmerLoading = ShimmerLoading();
  final reusableWidget = ReusableWidget();

  var loading = false.obs;
  var loadingProdact = false.obs;

  var CatagoriData = <CategoriesModel>[].obs;
  var ProdactData = <ProdactModel>[].obs;

  @override
  void onInit() {
    getCategories();
    getProdact();
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
          children_count: result.data!["categories"]["data"][i]
              ["children_count"],
        ));

        loading(false);
      }
    } else {
      print(result.exception);
    }
  }

  Future<void> getProdact() async {
    loadingProdact(true);

    GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
    ProdactQueryMutation prodactQueryMutation = ProdactQueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(
            prodactQueryMutation.getMyProdact(int.parse("10"), int.parse("1"))),
      ),
    );

    if (!result.hasException) {
      for (var i = 0; i < result.data!["products"]["data"].length; i++) {
        for (var j = 0;
            j < result.data!["products"]["data"][i]["images"].length;
            j++) {
          ProdactData.add(ProdactModel(
            id: result.data!["products"]["data"][i]["id"],
            name: result.data!["products"]["data"][i]["name"],
            iamgelink: result.data!["products"]["data"][i]["images"][j],
            description: result.data!["products"]["data"][i]["description"],
          ));

          loadingProdact(false);
        }
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
