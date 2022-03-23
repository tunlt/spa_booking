import 'package:flutter/material.dart';
import 'package:spa_booking/Components/search_bar.dart';
import 'package:spa_booking/Screens/Search/components/spa_search_result.dart';

class Body extends StatelessWidget {
  String searchKey = "";

  Body({required this.searchKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:[

          ],
        ),

    );
  }
}
