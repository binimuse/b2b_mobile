import 'package:b2b_mobile/app/modules/prodact_detail/prodact_detail_model.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/models/Product.dart';
import 'package:flutter/material.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Information',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Weight', style: TextStyle(color: BLACK_GREY)),
                Text('300 Gram', style: TextStyle(color: BLACK_GREY))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Condition', style: TextStyle(color: BLACK_GREY)),
                Text('Second', style: TextStyle(color: BLACK_GREY))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Category', style: TextStyle(color: BLACK_GREY)),
                GestureDetector(
                  onTap: () {},
                  child: const Text('Food',
                      style: TextStyle(color: kPrimaryColor)),
                )
              ],
            ),
          ],
        ));
  }
}
