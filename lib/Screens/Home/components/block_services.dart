import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/SpaDetail/spa_detail_screen.dart';
import 'package:spa_booking/controller/services.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/models/services.dart';
import 'package:spa_booking/models/spa.dart';
import 'package:spa_booking/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
  final ServicesController _servicesController = Get.find<ServicesController>();
class BlockServices extends StatelessWidget {
  //===============color
  Color colorTitle = Color.fromRGBO(190, 62, 62, 1);
  Color colorSale = Color.fromRGBO(197, 136, 39, 1);

  //===============data
  String lastPage = "home";

  //===============var
  String image = StrConstants.imgPath + "spa3.png";
  // Service service;

  // BlockSpa(
  //     {required this.service
  //     });
  //dat
  BlockServices(this.services);
  final Services services;

  @override
  Widget build(BuildContext context) {
    // if(service.cateType=="Massage")
    //   image=StrConstants.imgPath+"massage.png";
    // if(service.cateType=="Facial")
    //   image=StrConstants.imgPath+"facial1.png";
    // if(service.cateType=="Sauna")
    //   image=StrConstants.imgPath+"sauna.png";
    // if(service.cateType=="Hot stone therapy")
    //   image=StrConstants.imgPath+"hotStoneTherapy.png";
    Size size = MediaQuery.of(context).size;
     return GestureDetector(
      onTap: () =>  _servicesController.getServicesDetail(services.id),
      child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                 SingleChildScrollView(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 10, 5, 5),
                        child: Container(
                          width: 150,
                          height: 120,
                          child: Image.network('${services.urlImage}'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 5, 20, 0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${services.name}",
                                style: TextStyle(
                                    color: ColorConstants.textColorBold,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                               Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/price.png",
                                    width: 18,
                                    color: Color.fromRGBO(33, 159, 13, 1),
                                  ),
                                  Text(
                                    "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(services.price)}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.timelapse,
                                          color: Colors.pink,
                                          size: 12.0,
                                        ),
                                        Text(
                                          "${services.duration} minute",
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                           
                    SizedBox(width: 10,),
                    
                            ],
                          ),
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
