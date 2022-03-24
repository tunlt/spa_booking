
import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/Appointment/components/history.dart';
import 'package:spa_booking/Screens/Appointment/components/upcoming.dart';
import 'package:spa_booking/controller/appointment.dart';
import 'package:spa_booking/models/appointment.dart';


import 'package:get/get.dart';
class BodyAppointment extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BodyAppointment();
  }
}
class _BodyAppointment extends State<BodyAppointment>{
  // final SpaController _spaController = Get.find<SpaController>();
  final AppointmentController _appointmentController = Get.find<AppointmentController>();
  late final BookingService bookingservice;
  @override
  Widget build(BuildContext context) {

    // Service service=list.allService[0];
    Size size =MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text(
              "Appointments Upcoming",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: GetBuilder<AppointmentController>(
                        builder: (controller) => (controller.isLoading.isTrue)
                            ? const Center(child: CircularProgressIndicator())
                            : controller.listBookingServicesIsfalse.isEmpty
                                ? const Center(child: Text('chưa có booking nào!'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (ctx, i) =>
                                        UpcomingServiceBox(_appointmentController.listBookingServicesIsfalse[i]),
                                    itemCount: controller.listBookingServicesIsfalse.length,
                                  ),
                      ),
                    ),
           
              // UpcomingServiceBox(bookingService: BookingService(service.name, service.rate, service.price,service.cateType,service.sale,service.spa)),
            SizedBox(height: 12,),
            Text(
              "Appointments History",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 15,),

           Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: GetBuilder<AppointmentController>(
                        builder: (controller) => (controller.isLoading.isTrue)
                            ? const Center(child: CircularProgressIndicator())
                            : controller.listBookingServices.isEmpty
                                ? const Center(child: Text('chưa có booking nào!'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (ctx, i) =>
                                        HistoryServiceBox(_appointmentController.listBookingServices[i]),
                                    itemCount: controller.listBookingServices.length,
                                  ),
                      ),
                    ),

          ],
        ),
      )
    );
  }
}
