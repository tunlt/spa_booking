import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/SpaDetail/spa_detail_screen.dart';
import 'package:spa_booking/controller/spa.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/models/spa.dart';
import 'package:spa_booking/utils/constants.dart';
import 'package:get/get.dart';

class BlockSpa extends StatelessWidget {
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
  BlockSpa(this.spa);
  final Spa spa;
  final SpaController _spaController = Get.find<SpaController>();
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
      onTap: () => _spaController.getSpaDetail(spa.id),
      child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.35,
                height: size.width * 0.25,
                child: Image.network('${spa.urlImage}'),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Container(
                    width: size.width * 0.35,
                    child: Expanded(
                      child: Text(
                        "${spa.spaName}",
                        //  ' service.name+" "+service.cateType',
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/location.png", width: 18),
                      Text(
                        "${spa.address}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.pink,
                        size: 18.0,
                      ),
                      Text(
                        "${spa.phone}",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )),
              if (2 > 0)
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.pink,
                          size: 18.0,
                        ),
                        Text(
                          "${spa.email}",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )),
            ],
          )),
    );
  }
}
