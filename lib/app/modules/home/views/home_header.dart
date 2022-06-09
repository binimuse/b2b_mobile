import 'package:b2b_mobile/app/modules/cart/views/cart_view.dart';
import 'package:b2b_mobile/app/modules/home/views/search_field.dart';
import 'package:b2b_mobile/app/modules/notification/views/notification_view.dart';
import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () {
                //Navigator.pushNamed(context, CartScreen.routeName),

                Get.toNamed(Routes.CART);
              }),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {
              Get.toNamed(Routes.NOTIFICATION);

              //  Navigator.pushNamed(context, NotificationPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
