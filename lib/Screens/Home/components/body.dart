import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/Components/search_bar.dart';
import 'package:spa_booking/Screens/Home/components/block_services.dart';
import 'package:spa_booking/Screens/Home/components/block_spa.dart';
import 'package:spa_booking/Screens/Search/search_screen.dart';
import 'package:spa_booking/controller/services.dart';
import 'package:spa_booking/controller/spa.dart';
import 'package:spa_booking/models/list_spa.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/utils/constants.dart';


import 'package:get/get.dart';

class Body extends StatelessWidget {
  final SpaController _spaController = Get.find<SpaController>();
  //============color

  Color colorTitle = Color.fromRGBO(190, 62, 62, 1);
  @override
  Widget build(BuildContext context) {
    // ListSpa list=new ListSpa();
    // List<Service> byDistance=list.getByDistance();
    // List<Service> byRate=list.getByRate();
    // List<Service> bySale=list.getBySale();

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: [
          Column(
            children: [
              //=====================================================================================================SEARCH
              SearchBar(searchText: "Search"),
              //=================================================================================IMAGE
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                  ),
                  items: [
                    Image.asset(
                      "assets/images/spa4.png",
                      width: size.width * 1,
                    ),
                    Image.asset("assets/images/spa2.png",
                        width: size.width * 1),
                    Image.asset("assets/images/spa3.png",
                        width: size.width * 1),
                  ],
                ),
              ),
              //=====================================================================================================ICON function
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen(searchKey: "#Facial");
                        },
                      ));
                    },
                    icon: Image.asset("assets/icons/facial.png"),
                    iconSize: size.width * 0.2,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen(searchKey: "#Massage");
                        },
                      ));
                    },
                    icon: Image.asset("assets/icons/massage.png"),
                    iconSize: size.width * 0.2,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen(searchKey: "#Sauna");
                        },
                      ));
                    },
                    icon: Image.asset("assets/icons/sauna.png"),
                    iconSize: size.width * 0.2,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen(searchKey: "#HotStoneTherapy");
                        },
                      ));
                    },
                    icon: Image.asset("assets/icons/hotStoneTherapy.png"),
                    iconSize: size.width * 0.2,
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Column(children: <Widget>[
                    //=========================================================================================================NEAR SPA
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Near by Spa",
                            style: TextStyle(
                                color: ColorConstants.textColorBold,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return SearchScreen(searchKey: "#SpaNearBy");
                                },
                              ));
                            },
                            child: Text(
                              "See more",
                              style: TextStyle(
                                  color: Colors.red[200],
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 24.0),
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: GetBuilder<SpaController>(
                        builder: (controller) => (controller.isLoading.isTrue)
                            ? const Center(child: CircularProgressIndicator())
                            : controller.listSpa.isEmpty
                                ? const Center(child: Text('Không có spa nào!'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, i) =>
                                        BlockSpa(controller.listSpa[i]),
                                    itemCount: controller.listSpa.length,
                                  ),
                      ),
                    ),
                    //==================================================HIGH RATING
                    Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "List services",
                            style: TextStyle(
                                color: ColorConstants.textColorBold,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return SearchScreen(searchKey: "#HighRating");
                                },
                              ));
                            },
                            child: Text(
                              "See more",
                              style: TextStyle(
                                  color: Colors.red[200],
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 24.0),
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: GetBuilder<ServicesController>(
                        builder: (controller) => (controller.isLoading.isTrue)
                            ? const Center(child: CircularProgressIndicator())
                            : controller.listServices.isEmpty
                                ? const Center(
                                    child: Text('Không có dịch vụ nào!'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, i) => BlockServices(
                                        controller.listServices[i]),
                                    itemCount: controller.listServices.length,
                                  ),
                      ),
                    ),
                  ])),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
