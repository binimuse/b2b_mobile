import 'package:b2b_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:b2b_mobile/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountBanner extends GetView<WalletController> {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, WalletAppClone.routeName);

        Get.toNamed(Routes.WALLET);
      },
      child: Container(
        // height: 90,
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text.rich(
          TextSpan(
            style: const TextStyle(color: Colors.white),
            children: [
              const TextSpan(text: "your current ammount\n"),
              TextSpan(
                text: "Wallet 500 ETB",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
