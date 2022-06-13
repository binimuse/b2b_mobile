// ignore_for_file: non_constant_identifier_names

import 'package:b2b_mobile/app/modules/home/catagories_model.dart';
import 'package:b2b_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:b2b_mobile/app/modules/home/views/special_categories_detail.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'section_title.dart';

class SpecialOffers extends GetView<HomeController> {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Special categories",
            press: () {
              Get.to(CategoriesView());
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Obx(
          () => controller.loading.value != false
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 100,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.CatagoriData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SpecialOfferCard(
                                controller.CatagoriData[index],
                                context,
                              ),
                            ]),
                      );
                    },
                  )),
        )
      ],
    );
  }

  Widget SpecialOfferCard(
    CategoriesModel catagoriData,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: getProportionateScreenWidth(272),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/sweets.jpg",
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.centerLeft,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(100),
                    vertical: getProportionateScreenWidth(5),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: catagoriData.name,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                          color: kPrimaryLightColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(95.0),
                    vertical: getProportionateScreenWidth(35),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: catagoriData.children_count.toString() +
                                " Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
