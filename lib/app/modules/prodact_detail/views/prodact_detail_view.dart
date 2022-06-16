import 'package:b2b_mobile/components/color_dots.dart';
import 'package:b2b_mobile/components/custom_app_bar.dart';
import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/components/product_description.dart';
import 'package:b2b_mobile/components/product_images.dart';
import 'package:b2b_mobile/components/top_rounded_container.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:b2b_mobile/models/Product.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prodact_detail_controller.dart';

class ProdactDetailView extends GetView<ProdactDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const CustomAppBar(rating: 4),
        ),
        body: Obx(() => controller.loading.value != false
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  ProductImages(image: controller.imagelink),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ProductDescription(
                          description: controller.description.value.toString(),
                          name: controller.name.value.toString(),
                          pressOnSeeMore: () {},
                        ),
                        TopRoundedContainer(
                          color: const Color(0xFFF6F7F9),
                          child: Column(
                            children: [
                              const ColorDots(),
                              TopRoundedContainer(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.15,
                                    right: SizeConfig.screenWidth * 0.15,
                                    bottom: getProportionateScreenWidth(40),
                                    top: getProportionateScreenWidth(15),
                                  ),
                                  child: DefaultButton(
                                    text: "Add To Cart",
                                    press: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )));
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
