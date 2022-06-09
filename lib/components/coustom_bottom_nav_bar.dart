import 'package:b2b_mobile/app/modules/home/views/home_view.dart';
import 'package:b2b_mobile/app/modules/order/views/order_view.dart';
import 'package:b2b_mobile/app/modules/profile/views/profile_view.dart';
import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, HomeScreen.routeName),

                    Get.toNamed(Routes.HOME);
                  }
                  //
                  ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/order.svg",
                  color: MenuState.order == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Get.toNamed(Routes.ORDER);

                  //   Navigator.pushNamed(context, OrderScreen.routeName);
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE);

                    //Navigator.pushNamed(context, ProfileScreen.routeName),
                  }),
            ],
          )),
    );
  }
}
