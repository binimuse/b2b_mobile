import 'package:b2b_mobile/app/modules/home/views/section_title.dart';
import 'package:b2b_mobile/app/modules/order/order_model.dart';
import 'package:b2b_mobile/app/modules/prodact_detail/controllers/prodact_detail_controller.dart';
import 'package:b2b_mobile/constant/cache_image_network.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../prodact_detail_model.dart';

class Information extends GetView<ProdactDetailController> {
  const Information({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(title: "Available variants", press: () {}),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            ...List.generate(controller.attributes.length, (index) {
              return _buildOrderHistoryCard(controller.attributes[index]);
            }),
            SizedBox(width: getProportionateScreenWidth(20))
          ],
        ));
  }

  Widget _buildOrderHistoryCard(ProdactattributesModel orderData) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Card(
        margin: const EdgeInsets.only(top: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // Get.to(const OrderDetailPage(),
            //     transition: Transition.noTransition);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCacheNetworkImage(
                    url: controller.imagelink[0], height: 90),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                                "${orderData.attribute_name} : " +
                                    orderData.attributeValue,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Obx(() => controller.loading.value != false
                              ? controller.shimmerLoading.buildShimmerContent()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: IconButton(
                                        icon: Icon(
                                          controller.selected.value
                                              ? Icons.add_shopping_cart_outlined
                                              : Icons.check,
                                          color: kPrimaryColor,
                                        ),
                                        onPressed: () {
                                          if (controller.selected.value ==
                                              false) {
                                            controller.selected(true);
                                          } else {
                                            controller.selected(false);
                                          }
                                          // controller.selected(false);
                                        },
                                      ), //IconButton
                                    ),
                                    Center(
                                      child: Text(
                                          controller.selected.value
                                              ? "Add to Cart"
                                              : "Item Added to cart",
                                          style: const TextStyle(
                                              fontSize: 11, color: SOFT_GREY)),
                                    ),
                                  ],
                                ))
                        ],
                      ),
                      Text("${orderData.price.toString()} : " + "ETB",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
