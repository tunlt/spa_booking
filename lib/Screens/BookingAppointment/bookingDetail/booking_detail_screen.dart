import 'package:flutter/material.dart';
import 'package:spa_booking/Components/app_bar.dart';
import 'package:spa_booking/Screens/BookingAppointment/bookingDetail/components/body.dart';
import 'package:spa_booking/models/service.dart';

import '../../../models/spa.dart';

class BookingDetailScreen extends StatelessWidget {
  List<Service> cart;
  String date;
  String time;
  Spa spa;
  BookingDetailScreen({required this.cart,required this.date, required this.time, required this.spa});
  @override
  Widget build(BuildContext context) {
    String title = "Booking Detail";
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopBar.getAppBarHasBackIcon(
          size, context, title,
              (){
            Navigator.pop(context);
          }
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 0),
        child: BodyBookingDetail(cart:cart, date: date,time: time, spa: spa),
      ),
    );
  }
}
