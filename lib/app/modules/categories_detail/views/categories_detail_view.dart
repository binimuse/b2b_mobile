import 'package:b2b_mobile/app/modules/categories_detail/controllers/categories_detail_controller.dart';
import 'package:b2b_mobile/components/coustom_bottom_nav_bar.dart';
import 'package:b2b_mobile/constant/cache_image_network.dart';
import 'package:b2b_mobile/constant/enums.dart';
import 'package:b2b_mobile/constant/global_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../catagories_detail_model.dart';

class CategoriesDetailView extends GetView<CategoriesDetailController> {
  const CategoriesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        centerTitle: true,
        title: const Text('Categories', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: controller.reusableWidget.bottomAppBar(),
      ),
      body: Obx(
        () => controller.loading.value
            ? controller.shimmerLoading.buildShimmerContent()
            : ListView.builder(
                itemCount: controller.CatagoriDetailData.length,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _buildOrderHistoryCard(
                      controller.CatagoriDetailData[index]);
                },
              ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.order),
    );
  }

  Widget _buildOrderHistoryCard(CategoriesDetailModel orderData) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // Get.to(const OrderDetailPage(), transition: Transition.noTransition);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCacheNetworkImage(height: 40, url: orderData.iamgelink),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(orderData.name,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            // Text(orderData.date,
                            //     style:
                            //         TextStyle(fontSize: 11, color: SOFT_GREY)),
                            // Text(orderData.time,
                            //     style:
                            //         TextStyle(fontSize: 11, color: SOFT_GREY)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
