import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/Appointment/appointment_upcoming_screen.dart';
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/Login/login_screen.dart';
import 'package:spa_booking/Screens/Register/register_screen.dart';
import 'package:spa_booking/Screens/SpaDetail/servies_detail_screen.dart';
import 'package:spa_booking/Screens/SpaDetail/spa_detail_screen.dart';
import 'package:spa_booking/binding/binding.dart';



import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Binding().dependencies();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_screen',
      getPages: [
        GetPage(
          name: '/home_screen',
          page: () => MainScreen(),
          binding: Binding(),
        ),
        GetPage(
          name: '/servies_detail_screen',
          page: () => ServicesDetailScreen(),
          binding: Binding(),
        ),
        GetPage(
          name: '/spa_detail_screen',
          page: () => SpaDetailScreen(),
          binding: Binding(),
        ),
        GetPage(
          name: '/register_screen',
          page: () => RegisterScreen(),
          binding: Binding(),
        ),
        GetPage(
          name: '/login_screen',
          page: () => LoginScreen(),
          binding: Binding(),
        ),
        GetPage(
          name: '/appointment_upcoming_screen',
          page: () => AppointmentScreen(finished: false),
          binding: Binding(),
        ),
      ],
    ),
  );
}


//services -> books_services

