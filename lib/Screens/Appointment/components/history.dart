import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/utils/constants.dart';

class HistoryServiceBox extends StatelessWidget {
  Service2 service;
  bool cancel;

  HistoryServiceBox({required this.service, required this.cancel});

  @override
  Widget build(BuildContext context) {
    Color colorBackground = ColorConstants.mainColor;
    Color colorStatus = ColorConstants.mainColorBold;
    Color colorText = Color.fromRGBO(144, 0, 0, 1);
    String status = "finished";
    if (cancel) {
      colorBackground = Color.fromRGBO(239, 239, 239, 1);
      colorStatus = Color.fromRGBO(196, 196, 196, 1);
      colorText = Colors.black;
      status = "canceled";
    }
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: colorBackground),
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
                    Image.asset(
                      StrConstants.imgPath + "spa1.png",
                      width: size.width * 0.28,
                      height: size.width * 0.28,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: size.width * 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name,
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
                            "Address: ",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            // "Date: " + service.spa.address,
                            "Date: ",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            // "Time: " + service.spa.address,
                            "Time: ",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            // "Phone: " + service.spa.phone,
                            "Phone: ",
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                  ),
                  color: colorStatus,
                ),

                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(
                        color: colorText, fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
