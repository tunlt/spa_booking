
import 'package:flutter/material.dart';
import 'package:spa_booking/models/appointment.dart';
import 'package:spa_booking/utils/constants.dart';
class HistoryServiceBox extends StatelessWidget{
  
  HistoryServiceBox(this.bookingService);
  BookingService bookingService;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      // onTap: () => _spaController.getSpaDetail(spa.id),
      child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.30,
                      height: size.width * 0.25,
                      child: Image.network('${bookingService.urlImage}'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${bookingService.spaName}",
                            style: TextStyle(
                                color: ColorConstants.textColorBold,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            // "Address: " + service.spa.address,
                            "time: "+ "${bookingService.timeStart}" + " - "+"${bookingService.timeEnd}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            // "Date: " + service.spa.address,
                            "Price: "+ "${bookingService.price}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                         Container(
                    width: 120,
                    height: 22,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
         
          ),
    );
    
  }

}