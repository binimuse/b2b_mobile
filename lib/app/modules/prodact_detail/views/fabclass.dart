import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFabParent extends StatelessWidget {
  final Widget child;
  const MyFabParent({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned(
          bottom: 0,
          right: 0,
          child: fabCart(context),
        )
      ],
    );
  }

  Widget fabCart(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CART);
        },
        child: Stack(
          children: [
            const Icon(Icons.shopping_bag_outlined,
                color: kPrimaryColor, size: 42),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(14),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
      ),
    );
  }
}
