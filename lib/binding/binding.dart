import 'package:get/get.dart';
import 'package:spa_booking/controller/appointment.dart';
import 'package:spa_booking/controller/login.dart';
import 'package:spa_booking/controller/register.dart';
import 'package:spa_booking/controller/services.dart';
import 'package:spa_booking/controller/spa.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpaController());
    Get.lazyPut(() => ServicesController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AppointmentController());
  }
}