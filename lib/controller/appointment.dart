import 'dart:io';

import 'package:get/get.dart';
import 'package:spa_booking/Screens/Appointment/appointment_upcoming_screen.dart';
import 'package:spa_booking/models/appointment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentController extends GetxController{
List<BookingService> listBookingServices = <BookingService>[].obs;
List<BookingService> listBookingServicesIsfalse = <BookingService>[].obs;
var isLoading = true.obs;


    Future<List<BookingService>> getBookingServices() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? cusstomerId = prefs.getInt('cusid');
      final String? token = prefs.getString('token');
    try {

      print(cusstomerId);
      isLoading(true);
      final response = await http.get(
        Uri.parse(
          'http://bookings3v1.somee.com/api/v1/booking_services/Getappointment${cusstomerId}?status=true'),
          headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      ); 
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var bookingService = bookingServicesFromJson(jsonString);
        if (bookingService.data != null) {
          listBookingServices = bookingService.data as List<BookingService>;
        }
        print(listBookingServices);
      }
      final response1 = await http.get(
        Uri.parse(
          'http://bookings3v1.somee.com/api/v1/booking_services/Getappointment${cusstomerId}?status=false'),
          headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
    
      ); 
      if (response1.statusCode == 200) {
        var jsonString = response1.body;
        var bookingService = bookingServicesFromJson(jsonString);
        if (bookingService.data != null) {
          listBookingServicesIsfalse = bookingService.data as List<BookingService>;
          print(listBookingServicesIsfalse);
        }
      }
      Get.to(AppointmentScreen(finished: true));
      update();
    } catch (error) {
      print('loi');
    } finally {
      isLoading(false);
    }
    return listBookingServices;
  }
}