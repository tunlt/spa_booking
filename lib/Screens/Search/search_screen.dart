import 'package:flutter/material.dart';
import 'package:spa_booking/Components/app_bar.dart';
import 'package:spa_booking/Components/bottom_bar.dart';
import 'package:spa_booking/Components/search_bar.dart';
import 'package:spa_booking/Screens/Search/components/body.dart';


class SearchScreen extends StatelessWidget {
  String searchKey = "";

  SearchScreen({required this.searchKey});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: TopBar.getAppBarLocation(size, context),
        body: Container(
          child: Column(
            children: [
             SearchBar(searchText: searchKey) ,
              Expanded(child: Body(searchKey: searchKey))

            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red[100],
          child: BottomBarSpaApp(selected: "search",),
        ));
  }
}
