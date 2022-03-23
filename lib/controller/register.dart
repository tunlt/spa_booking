
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:spa_booking/Screens/Login/login_screen.dart';


class RegisterController extends GetxController{

  Future<void> addRegister(TextEditingController emailController, fullnameController, usernameController,passwordController, addressController,dobController,phoneController) async {
    
    try{
      final Map<String, String> queryparam = {
        'emailuser': emailController.text,
        'fullname': fullnameController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'address': addressController.text,
        'dob': dobController.text,
        'phone' : phoneController.text
      };
      // String body = json.encode({
      //   'emailuser': emailController.text,
      //   'fullname': fullnameController.text,
      //   'username': usernameController.text,
      //   'password': passwordController.text,
      //   'address': addressController.text,
      //   'dob': dobController.text,
      //   'phone' : phoneController.text
      // }
      // );
      print(queryparam);
      final response = await http.post(
        Uri.parse(
          "http://bookings3v1.somee.com/api/v1.0/register/register_customer_v2")
            .replace(queryParameters: queryparam),
        // headers: {
        //   "Content-Type": "application/json"},
        // body: body,
        
      );
      print("api len");
      if(response.statusCode == 200){
        print("regis success");
        Get.to(LoginScreen());
        Fluttertoast.showToast(
            msg: "register successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }else{
        print("fail regis");
        Fluttertoast.showToast(
            msg: "register fail",
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

}