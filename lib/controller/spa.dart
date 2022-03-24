import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/SpaDetail/spa_detail_screen.dart';
import 'dart:convert';

import 'package:spa_booking/models/spa.dart';

class SpaController extends GetxController {
  List<Spa> listSpa = <Spa>[].obs;
  var isLoading = true.obs;
  List<Spa> spaDetail = <Spa>[].obs;

  @override
  onInit() {
    getSpa();
    super.onInit();
  }

  Future<List<Spa>> getSpa() async {
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse('http://bookings3v1.somee.com/api/v1/spas/Getalldetails'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var spa = spaReponseFromJson(jsonString);
        if (spa.data != null) {
          listSpa = spa.data as List<Spa>;
           update();
           print("helo");
          Get.to(MainScreen());
        }
      }
    } catch (error) {
      print('loi');
    } finally {
      isLoading(false);
    }
    return listSpa;
  }

  Future<List<Spa>> getSpaDetail(int? id) async {
    try {
      print('chay spa detail');
      print(id);
      isLoading(true);
      final response = await http
          .get(Uri.parse('http://bookings3v1.somee.com/api/v1/spas/${id}'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var spa = spaReponseFromJson(jsonString);
        if (spa.data != null) {
          print('hihi');
          spaDetail = spa.data as List<Spa>;
          update();
          Get.to(SpaDetailScreen());
        }
      }
    } catch (error) {
      print('loi');
    } finally {
      isLoading(false);
    }
    return spaDetail;
  }
}
