import 'package:b2b_mobile/app/modules/home/views/special_offers.dart';
import 'package:b2b_mobile/components/coustom_bottom_nav_bar.dart';
import 'package:b2b_mobile/constant/enums.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              const HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              const DiscountBanner(),
              //  Categories(),
              const SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              const PopularProducts(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
