import 'package:b2b_mobile/app/modules/home/catagories_model.dart';
import 'package:b2b_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:b2b_mobile/components/coustom_bottom_nav_bar.dart';
import 'package:b2b_mobile/constant/cache_image_network.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/enums.dart';
import 'package:b2b_mobile/constant/global_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategoriesView extends GetView<HomeController> {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        centerTitle: true,
        title: Text('Categories', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: controller.reusableWidget.bottomAppBar(),
      ),
      body: ListView.builder(
        itemCount: controller.CatagoriData.length,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildOrderHistoryCard(controller.CatagoriData[index]);
        },
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.order),
    );
  }

  Widget _buildOrderHistoryCard(CategoriesModel orderData) {
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
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/sweets.jpg",
                height: 40,
                //40%
              ),
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
                          children: [
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
                    SizedBox(height: 8),
                    Text(orderData.brand.toString() + ' item',
                        style: TextStyle(fontSize: 12, color: SOFT_GREY))
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
