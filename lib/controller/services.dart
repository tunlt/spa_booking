import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/SpaDetail/servies_detail_screen.dart';
import 'package:spa_booking/models/services.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:spa_booking/models/spa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesController extends GetxController {
  List<Services> listServices = <Services>[].obs;
  var isLoading = true.obs;
  List<Services> servicesDetail = <Services>[].obs;
  
  @override
  onInit() {
    getServices();
    super.onInit();
  }

  Future<List<Services>> getServices() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('http://bookings3v1.somee.com/api/v1/services'));
      print('services');
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var services = servicesReponseFromJson(jsonString);
        if (services.data != null) {
          listServices = services.data as List<Services>;
          update();
        }
      }
    } catch (error) {
      print('loi');
    } finally {
      isLoading(false);
    }
    return listServices;
  }

  Future<List<Services>> getServicesDetail(int? id) async {
    try {
      print('chay services detail');
      print(id);
      isLoading(true);
      final response = await http
          .get(Uri.parse('http://bookings3v1.somee.com/api/v1/services/${id}'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var servies = servicesReponseFromJson(jsonString);
        if (servies.data != null) {
          print('hihi');
          servicesDetail = servies.data as List<Services>;
          update();
          Get.to(ServicesDetailScreen());
        }
      }
    } catch (error) {
      print('loi');
    } finally {
      isLoading(false);
    }
    return servicesDetail;
  }

  Future<void> bookServices( Spa spa, List<Service> cart, String time, String date) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('cusid');
    try {
      print('chay book');
      String datetime = date + ' ' + time;
      print(datetime);
      DateTime timestart = DateFormat("yyyy-MM-dd hh:mm").parse(datetime);
      // print(timestart);
      print(timestart.add(Duration(minutes: cart[0].duration!)).toString());
      print(DateFormat.Hm()
          .format(timestart.add(Duration(minutes: cart[0].duration!))));
      print('duration');
      final Map<String, String> queryparam = {
        'staffid': '3',
        'price': cart[0].price.toString(),
        'timestart': time,
        'timeend': DateFormat.Hm()
            .format(timestart.add(Duration(minutes: cart[0].duration!))),
        'quantity': 1.toString(),
        'serviceid': cart[0].id.toString(),
        'spaid': spa.id.toString(),
        'cusid': customerId.toString(),
      };
      // String body = json.encode({
      //   'staffid': 3,
      //   'price': cart[0].price,
      //   'timstart': '9:20',
      //   'timeend': '9:50',
      //   'quantity': 1,
      //   'serviceid': cart[0].id,
      //   'spaid': spa.id,
      //   'cusid': 1,
      // });
      // print(body);
      // final response = await http.post(
      //   Uri.parse("http://bookings3v1.somee.com/api/v1/booking_services"),
      //   headers: {
      //     "Content-Type": "application/json",
      //   },
      //   body: body,
      // );
      // final response = await http.post(
      final response = await http.post(
        Uri.parse("http://bookings3v1.somee.com/api/v1/booking_services")
            .replace(queryParameters: queryparam),
      );
      print(customerId);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.to(MainScreen());
        Fluttertoast.showToast(
            msg: "book successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);  
      }
    } catch (e) {
      Fluttertoast.showToast(
            msg: "book fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.shade200,
            textColor: Colors.black,
            fontSize: 16.0);
      print('loi');
    }
  }
}
