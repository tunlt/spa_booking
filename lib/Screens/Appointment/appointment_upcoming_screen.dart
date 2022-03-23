import 'package:flutter/material.dart';
import 'package:spa_booking/Components/app_bar.dart';
import 'package:spa_booking/Components/bottom_bar.dart';
import 'package:spa_booking/Screens/Appointment/components/body.dart';
class AppointmentScreen extends StatelessWidget{
  bool finished=false;
  AppointmentScreen({required this.finished});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar.getAppBarLocation(size, context),
      body: BodyAppointment(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[100],
        child: BottomBarSpaApp(selected: "appointment",),
      ),
    );
  }

}