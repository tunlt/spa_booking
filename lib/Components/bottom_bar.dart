import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spa_booking/Screens/Appointment/appointment_upcoming_screen.dart';
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/Search/search_screen.dart';
import 'package:spa_booking/controller/appointment.dart';

class BottomBarSpaApp extends StatelessWidget {
  String selected="";
  Color colorSelected= Colors.white;
  Color colorNormal= Color.fromRGBO(87, 79, 79, 1);
  BottomBarSpaApp({required this.selected});
   final AppointmentController appointmentController = Get.find<AppointmentController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if(selected == "home")
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/home.png",
                  color: Colors.white,
                  width: size.width * 0.09,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                )
              ],
            ),
          )
        else
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/home.png",
                  color: Colors.black45,
                  width: size.width * 0.09,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black45),
                )
              ],
            ),
          )
        ,
        //=============================================================APPOINTMENT
        if(selected == "appointment")
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/appointment.png",
                  color: Colors.white,
                  width: size.width * 0.09,
                ),
                Text(
                  "Appointment",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                )
              ],
            ),
          )
        else
          GestureDetector(
            onTap: () => appointmentController.getBookingServices(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/appointment.png",
                  color: Colors.black45,
                  width: size.width * 0.09,
                ),
                Text(
                  "Appointment",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black45),
                )
              ],
            ),
          )
        ,
        //=============================================================SEARCH
        if(selected == "search")
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen(searchKey: "");
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/searchBot.png",
                  color: Colors.white,
                  width: size.width * 0.09,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                )
              ],
            ),
          )
        else
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AppointmentScreen(finished: true);
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/searchBot.png",
                  color: Colors.black45,
                  width: size.width * 0.09,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black45),
                )
              ],
            ),
          )
        ,
        // //=============================================================TREATMENT
        // if(selected == "treatment")
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(
        //         builder: (context) {
        //           return MainScreen();
        //         },
        //       ));
        //     },
        //     icon: Image.asset("assets/icons/treatment.png",color: colorSelected,),
        //     iconSize: size.width * 0.09,
        //   )
        // else
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(
        //         builder: (context) {
        //           return MainScreen();
        //         },
        //       ));
        //     },
        //     icon: Image.asset("assets/icons/treatment.png", color: colorNormal,),
        //     iconSize: size.width * 0.09,
        //   )
        // ,
        //=============================================================
        if(selected == "profile")
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/profile.png",
                  color: Colors.white,
                  width: size.width * 0.09,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 12, color: Colors.white),
                )
              ],
            ),
          )
        else
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AppointmentScreen(finished: true);
              },));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/profile.png",
                  color: Colors.black45,
                  width: size.width * 0.09,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black45),
                )
              ],
            ),
          )
      ],
    ),
    );
  }
}
