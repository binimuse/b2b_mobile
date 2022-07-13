import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:b2b_mobile/app/modules/categories_detail/catagories_detail_model.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:b2b_mobile/constant/shimmer_loading.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../catagories_detail_query_mutation.dart';

class CategoriesDetailController extends GetxController {
  final reusableWidget = ReusableWidget();
  final shimmerLoading = ShimmerLoading();

  var loading = false.obs;
  final count = 0.obs;
  var CatagoriDetailData = <CategoriesDetailModel>[].obs;

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
        document: gql(CatagoriesDeatilQueryMutation.getMyDrugCatagoriesDetail),
        variables: <String, dynamic>{
          'id': int.parse(Get.arguments),
        },
      ),
    );

    if (!result.hasException) {
      for (var i = 0; i < result.data!["category"]["children"].length; i++) {
        CatagoriDetailData.add(CategoriesDetailModel(
          id: result.data!["category"]["children"][i]["id"],
          name: result.data!["category"]["children"][i]["name"],
          iamgelink: result.data!["category"]["children"][i]["image"],
        ));

        //   print(id);

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
