// ignore_for_file: must_be_immutable

import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutCard extends StatelessWidget {
  String dropdownValue = 'Distributor One';
  CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Select Distributor',
                    style: TextStyle(fontSize: 14, color: SOFT_GREY)),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/Distribution.svg"),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: BLACK55),
                      underline: Container(
                        height: 2,
                        color: kPrimaryColor,
                      ),
                      onChanged: (String? newValue) {
                        // setState(() {
                        //   dropdownValue = newValue!;
                        // });
                      },
                      items: <String>[
                        'Distributor One',
                        'Distributor Two',
                        'Distributor three',
                        'Distributor Four'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: " 337.15 ETB",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Place order",
                      press: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
