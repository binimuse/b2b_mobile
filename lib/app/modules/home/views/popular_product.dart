import 'package:b2b_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:b2b_mobile/components/product_card.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:b2b_mobile/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'section_title.dart';

class PopularProducts extends GetView<HomeController> {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Obx(() => controller.loadingProdact.value != false
            ? controller.shimmerLoading.buildShimmerContent()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(controller.ProdactData.length, (index) {
                      return ProductCard(
                          product: controller.ProdactData[index]);
                    }),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              ))
      ],
    );
  }
}
