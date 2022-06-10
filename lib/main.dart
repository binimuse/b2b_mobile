import 'package:b2b_mobile/Services/graphql_conf.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app/routes/app_pages.dart';
import 'constant/theme.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() {
  runApp(
    GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "B2B",
          theme: theme(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    ),
  );
}
