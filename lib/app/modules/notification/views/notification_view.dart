import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/global_style.dart';
import 'package:b2b_mobile/constant/reusable_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';
import 'order_status.dart';

class NotificationView extends GetView<NotificationController> {
  final _reusableWidget = ReusableWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Notification',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            return Future.value(true);
          },
          child: Container(
              child: ListView(children: <Widget>[
            _createItem(
                context: context,
                notifDate: '11 Sep 2019 08:40',
                notifTitle: 'Order Completed',
                notifMessage: 'Your order is completed',
                page: OrderStatusPage()),
            _createItem(
                context: context,
                notifDate: '11 Sep 2019 08:39',
                notifTitle: 'Order Arrived',
                notifMessage: 'Your order has arrived',
                page: OrderStatusPage()),
            _createItem(
                context: context,
                notifDate: '9 Sep 2019 14:12',
                notifTitle: 'Order Sent',
                notifMessage: 'Your order is being shipped by courier',
                page: OrderStatusPage()),
            _createItem(
                context: context,
                notifDate: '9 Sep 2019 14:12',
                notifTitle: 'Ready to Pickup',
                notifMessage:
                    'Your order is ready to be picked up by the courier',
                page: OrderStatusPage()),
            _createItem(
                context: context,
                notifDate: '9 Sep 2019 13:00',
                notifTitle: 'Trending Product',
                notifMessage:
                    'Hi Robert Steven, there is a trending product for you, check it out now'),
            _createItem(
                context: context,
                notifDate: '9 Sep 2019 12:12',
                notifTitle: 'Order Processed',
                notifMessage: 'Your order is being processed',
                page: OrderStatusPage()),
            _createItem(
                context: context,
                notifDate: '9 Sep 2019 11:52',
                notifTitle: 'Payment Received',
                notifMessage: 'Payment has been received',
                page: OrderStatusPage()),
            _createItem(
                context: context,
                notifDate: '9 Sep 2019 11:32',
                notifTitle: 'Waiting for Payment',
                notifMessage: 'We are waiting for your payment',
                page: OrderStatusPage()),
            _createItem(
              context: context,
              notifDate: '9 Sep 2019 11:32',
              notifTitle: 'Order Placed',
              notifMessage: 'We have received your order',
              page: OrderStatusPage(),
            ),
          ])),
        ));
  }

  Widget _createItem(
      {required String notifDate,
      required String notifTitle,
      required String notifMessage,
      StatefulWidget? page,
      required BuildContext context}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notifTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: CHARCOAL)),
                    SizedBox(
                      height: 4,
                    ),
                    Text(notifDate,
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 11)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(notifMessage, style: TextStyle(color: BLACK_GREY)),
                  ],
                )),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
