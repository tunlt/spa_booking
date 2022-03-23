import 'package:flutter/material.dart';
import 'package:spa_booking/Components/app_bar.dart';
import 'package:spa_booking/Components/bottom_bar.dart';
import 'package:spa_booking/Screens/Home/components/body.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar.getAppBarLocation(size, context),
      body: Body(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[100],
        child: BottomBarSpaApp(selected: "home",),
      ),
    );
  }
}
