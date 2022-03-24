

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/Login/login_screen.dart';

class LoginController extends GetxController {
   Future<void> LoginCustomer(TextEditingController usernameController,passwordController) async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      final Map<String, String> queryparam = {
        'email': usernameController.text,
        'password': passwordController.text,
      };

      print(queryparam);
      final response = await http.post(
        Uri.parse(
          "http://bookings3v1.somee.com/api/v1/firebaseservice/logincustomer")
            .replace(queryParameters: queryparam),
    
      );
      print("api len");
      if(response.statusCode == 200){
        print("Login success");
        var jsonString = json.decode(response.body);    
        Map<String, dynamic> payload = Jwt.parseJwt(response.body);
        print(payload);
        int customerId = jsonString['data'][0]['customerId'] as int;
        var token = jsonString['token'];
        prefs.setInt('cusid', customerId);
        prefs.setString('token', token);
        print(customerId);
        print(token);
        Get.to(MainScreen());
      }else{
        print("fail login");
        Fluttertoast.showToast(
            msg: "login fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.shade200,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }catch (error){
      print(error);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.to(LoginScreen());
  }
}