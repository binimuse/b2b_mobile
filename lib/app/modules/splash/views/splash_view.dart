import 'package:b2b_mobile/app/modules/splash/views/splash_content.dart';
import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Obx(
      () => controller.loading.value != true
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        controller.currentPage.value = value;
                      },
                      itemCount: controller.splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        image: controller.splashData[index]["image"],
                        text: controller.splashData[index]['text'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: <Widget>[
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.splashData.length,
                              (index) => buildDot(index: index),
                            ),
                          ),
                          const Spacer(flex: 3),
                          DefaultButton(
                            text: "Continue",
                            press: () {
                              if (controller.acc != null) {
                                Get.toNamed(Routes.HOME);
                              } else {
                                Get.toNamed(Routes.SIGNIN);
                              }
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
    ));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: controller.currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: controller.currentPage == index
            ? kPrimaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
