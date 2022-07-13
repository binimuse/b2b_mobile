import 'package:b2b_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:b2b_mobile/app/modules/home/product_model.dart';
import 'package:b2b_mobile/app/modules/prodact_detail/views/prodact_detail_view.dart';
import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/constant/cache_image_network.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:b2b_mobile/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductCard extends GetView<HomeController> {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final ProdactModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.PRODACT_DETAIL,
              arguments: {
                "product": product.id.toString(),
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.6,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: buildCacheNetworkImage(url: product.iamgelink),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
