import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:spa_booking/controller/services.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/utils/constants.dart';

import '../../../../models/spa.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BodyBookingDetail extends StatefulWidget {
  List<Service> cart;
  String date;
  String time;
  Spa spa;

  BodyBookingDetail(
      {required this.cart,
      required this.date,
      required this.time,
      required this.spa});

  @override
  State<StatefulWidget> createState() {
    return _BodyBookingDetail();
  }
}

class _BodyBookingDetail extends State<BodyBookingDetail> {
  final ServicesController _servicesController = Get.find<ServicesController>();
  String x = "";
  double total = 0;
  int num = 7;

  @override
  Widget build(BuildContext context) {
    String datetime = widget.date + ' ' + widget.time;
    DateTime timestart = DateFormat("yyyy-MM-dd hh:mm").parse(datetime);
    DateTime tmpDate = DateFormat("yyyy-MM-dd").parse(widget.date);
    String timeend = DateFormat.Hm()
        .format(timestart.add(Duration(minutes: widget.cart[0].duration!)));
    //Size
    Size size = MediaQuery.of(context).size;
    //calculate total
    for (Service service in widget.cart) {
      total += (service.price!);
    }
    //calculate PM or AM
    if (int.parse(widget.time.split(":")[0]) < 12 &&
        int.parse(widget.time.split(":")[0]) >= 0)
      x = "AM";
    else
      x = "PM";
    //calculate num
    if (widget.cart.length <= num)
      for (Service service in widget.cart) num -= 1;
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 12, right: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "${widget.spa.spaName}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (size.width - 24) * 0.7,
                  child: Text(
                    "Phone: ${widget.spa.phone}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      StrConstants.iconPath + "phone.png",
                      width: (size.width - 24) * 0.1,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Date: ${DateFormat("EEE, MMM d, yyyy").format(tmpDate)}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Duration: ${widget.cart[0].duration} minutes",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Time start: ${widget.time} $x",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Time end: ${timeend} $x",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Your Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (Service service in widget.cart) createService(service),
              ],
            ),
            for (int i = 0; i < num; i++)
              SizedBox(
                height: 30,
              ),
            Center(
              child: Container(
                width: (size.width - 24) * 0.8,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black45, width: 2))),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Total Price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(total)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorConstants.textColorBold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: size.width * 0.4,
                    child: RaisedButton(
                      onPressed: () => _servicesController.bookServices(
                          widget.spa, widget.cart, widget.time, widget.date),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: ColorConstants.textColorBold,
                      child: Text(
                        "Finish",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
                // Container(
                //   width: size.width * 0.3,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(5))
                //   ),
                //   child: RaisedButton(
                //       onPressed: (){},
                //     color: ColorConstants.textColorBold,
                //     child: Text(
                //         "Go Back",
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget createService(Service service) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: ColorConstants.priceBeforeSaleColor,
        ))),
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service.name!,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorConstants.mainColorBold,
                    fontWeight: FontWeight.bold),
              ),
              if (0 <= 0)
                Text(
                  "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(service.price)}",
                  style: TextStyle(fontSize: 14, color: Colors.red),
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(service.price)}",
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.priceBeforeSaleColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(service.price)}",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),
            ],
          ),
        ));
  }
}
