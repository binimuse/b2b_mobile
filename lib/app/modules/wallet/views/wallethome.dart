import 'package:b2b_mobile/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:b2b_mobile/app/modules/wallet/views/topup.dart';
import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/components/top_rounded_container.dart';
import 'package:b2b_mobile/constant/cache_image_network.dart';
import 'package:b2b_mobile/constant/global_style.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "25895 ETB",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
              const Text(
                "Available Balance",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return _showLoanPopup(context);
                        },
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(243, 245, 248, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.blue[900],
                            size: 30,
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Credit",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return _showPaymentPopup();
                        },
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(243, 245, 248, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Icon(
                            Icons.trending_up,
                            color: Colors.blue[900],
                            size: 30,
                          ),
                          padding: EdgeInsets.all(12),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Topup",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        DraggableScrollableSheet(
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(243, 245, 248, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Recent Transactions",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "All",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[500]!,
                                      blurRadius: 30.0,
                                      spreadRadius: 4.5)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.green,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "accepted",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[200]!,
                                      blurRadius: 10.0,
                                      spreadRadius: 4.5)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.orange,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[200]!,
                                      blurRadius: 10.0,
                                      spreadRadius: 4.5)
                                ]),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[500]),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 32),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: Icon(
                                  Icons.date_range,
                                  color: Colors.lightBlue[900],
                                ),
                                padding: EdgeInsets.all(12),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Payment accepted",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Payment from user",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "+500.5 ETB",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.lightGreen),
                                  ),
                                  Text(
                                    "26 Jan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: 2,
                      padding: EdgeInsets.all(0),
                      controller: ScrollController(keepScrollOffset: false),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                controller: scrollController,
              ),
            );
          },
          initialChildSize: 0.65,
          minChildSize: 0.65,
          maxChildSize: 1,
        )
      ],
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _showLoanPopup(context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: const Text('Credit Application Form',
                    style: GlobalStyle.chooseCourier),
              ),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Phone',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 5, // allow user to enter 5 line in textfield
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: 'Comments',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Submit",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _showPaymentPopup() {
    return SingleChildScrollView(
      child:
          StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: const Text('Choose Payment',
                  style: GlobalStyle.chooseCourier),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 32,
              color: Colors.grey[400],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TopUpPage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text('Pay with Normal payment',
                    style: GlobalStyle.courierTitle),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                'use your Normal payment to complete your purchase',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'WorkSans',
                ),
              ),
            ),
            Divider(
              height: 15,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildCacheNetworkImage(
                          url:
                              "https://play-lh.googleusercontent.com/Mtnybz6w7FMdzdQUbc7PWN3_0iLw3t9lUkwjmAa_usFCZ60zS0Xs8o00BW31JDCkAiQk=s180-rw",
                          width: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Pay with telebirr',
                          style: GlobalStyle.courierTitle),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'use your tele birr account to complete your purchase',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                    ),
                  ]),
            ),
            Divider(
              height: 15,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildCacheNetworkImage(
                  url: "https://www.yenepay.com/images/logo.png", width: 38),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Pay with Yenepay', style: GlobalStyle.courierTitle),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'use your yenebirr account to complete your purchase',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'WorkSans',
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/yenepay.png',
                  height: 30,
                  width: 190,
                )),
            Divider(
              height: 32,
              color: Colors.grey[400],
            ),
          ],
        );
      }),
    );
  }
}
