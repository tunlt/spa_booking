import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:spa_booking/Screens/BookingAppointment/bookingDetail/booking_detail_screen.dart';
import 'package:spa_booking/Screens/BookingAppointment/step1/components/back_next_button.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/utils/constants.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../models/spa.dart';

class Body extends StatefulWidget {
  List<Service> cart;
  Spa spa;
  Body({required this.cart, required this.spa});

  @override
  State<StatefulWidget> createState() {
    return _Body();
  }
}

class _Body extends State<Body> {
  DateTime thisDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime minDate=DateTime.now();
  DateTime maxDate=DateTime.now().add(Duration(days: 15));
  String selectedTime="";

  onSelectDate(DateRangePickerSelectionChangedArgs date) {
    setState(() {
      DateTime time1=DateTime(thisDate.year,thisDate.month,thisDate.day);
      DateTime time2=DateTime(date.value.year,date.value.month,date.value.day);
      if(time1.isAtSameMomentAs(time2)){

      }else
        selectedDate = date.value;
    });
  }



  @override
  Widget build(BuildContext context) {
    //Size
    Size size = MediaQuery.of(context).size;
    //reset var
    thisDate = DateTime.now();
    //set max min
    minDate=DateTime.now();
    //Widget
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                //===============================SELECT DATE
                Row(
                  children: [
                    Text(
                      "Date: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${selectedDate.toString().split(" ")[0]}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.mainColorBold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SfDateRangePicker(
                  onSelectionChanged: onSelectDate,

                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedDate: thisDate,
                  maxDate: maxDate,
                  minDate: minDate,
                  backgroundColor: ColorConstants.mainColor,
                  selectionColor: ColorConstants.mainColorBold,
                  selectionTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  headerStyle: DateRangePickerHeaderStyle(
                      backgroundColor: ColorConstants.mainColorBold),
                  todayHighlightColor: ColorConstants.mainColorBold,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                //===============================SELECT TIME
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              getBoxTime("07:00",false),
                              getBoxTime("07:20",false),
                              getBoxTime("07:40",false),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("08:00",false),
                              getBoxTime("08:20",false),
                              getBoxTime("08:40",false),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("09:00",true),
                              getBoxTime("09:20",true),
                              getBoxTime("09:40",true),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("10:00",false),
                              getBoxTime("10:20",true),
                              getBoxTime("10:40",true),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("13:00",true),
                              getBoxTime("13:20",true),
                              getBoxTime("13:40",true),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("14:00",true),
                              getBoxTime("14:20",true),
                              getBoxTime("14:40",true),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("15:00",true),
                              getBoxTime("15:20",true),
                              getBoxTime("15:40",true),
                            ],
                          ),
                          Column(
                            children: [
                              getBoxTime("15:00",true),
                              getBoxTime("15:20",true),
                              getBoxTime("15:40",true),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //===================================BOTTOM
          Component.getActionStepButton(context, false, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BookingDetailScreen(cart: widget.cart, date: selectedDate.toString().split(" ")[0], time: selectedTime, spa: widget.spa );
            },));
          })
        ],
      ),
    );
  }
  Padding getBoxTime(String time, bool available){
    if(selectedTime==time) {
      return Padding(
          padding: EdgeInsets.all(5),
        child: GestureDetector(
          child: Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    width: 1, color: Colors.black),
                color: ColorConstants.mainColorBold),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  time,
                  style: TextStyle(
                       color: Colors.black,fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      if(available)
        return Padding(
            padding: EdgeInsets.all(5),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime=time;
                });
              },
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                          width: 1, color: Colors.black),
                      color: Colors.white),
                  child:Center(
                    child: Text(
                      time,
                      style: TextStyle(
                          color: Colors.black,fontSize: 16),
                    ),
                  )
              ),
            ),
        );
      else
        return Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        width: 1, color: Colors.black),
                    color: Colors.grey[300]),
                child:Center(
                  child: Text(
                    time,
                    style: TextStyle(
                        color: Colors.black,fontSize: 16),
                  ),
                )
            ),
          ),
        );
    }
  }
}
