import 'dart:async';
import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:spa_booking/Components/app_bar.dart';
import 'package:spa_booking/Components/pick_function_button.dart';
import 'package:spa_booking/Screens/Appointment/appointment_upcoming_screen.dart';
import 'package:spa_booking/Screens/BookingAppointment/step1/booking_appointment_screen_1.dart';
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/Search/search_screen.dart';
import 'package:spa_booking/Screens/SpaDetail/components/review_box.dart';
import 'package:spa_booking/controller/spa.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/models/services.dart';
import 'package:spa_booking/models/spa.dart';
import 'package:spa_booking/utils/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final SpaController _spaController = Get.find<SpaController>();

class SpaDetailScreen extends StatefulWidget {
  String? searchKey = "";
  String? lastPage = "";
  Spa? spa;
  Service2? selectedService = null;
  List<Service> cart = [];

  List<Service2> listMassage = [];
  List<Service2> listFacial = [];
  List<Service2> listSauna = [];
  SpaDetailScreen() {}
  // SpaDetailScreen(
  //     {this.lastPage,
  //     this.searchKey,
  //     this.spa,
  //     Service2? service,
  //     List<Service2>? cartForward}) {
  //   if (service != null) selectedService = service;
  //   if (cartForward != null) cart = cartForward;
  // }
  @override
  State<StatefulWidget> createState() {
    return _SpaDetailScreen();
  }
}

class _SpaDetailScreen extends State<SpaDetailScreen> {
  String? selected = "Services";
  String? selectedCate = "Massage";
  bool? cartIsNull = true;
  @override
  void initState() {
    super.initState();
    Timer.run(() {
      // if (widget.selectedService != null)
      //   showMyAlertDialog(widget.selectedService);
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = "Spa";
    if (widget.cart.isEmpty) {
      cartIsNull = true;
    } else {
      cartIsNull = false;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Spa Detail'),
        backgroundColor: Colors.red[200],
      ),
      // appBar: TopBar.getAppBarSpaDetail(size, context, title, () {
      //   if (widget.lastPage == "home")
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return MainScreen();
      //       },
      //     ));
      //   else if (widget.lastPage == "search")
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return SearchScreen(searchKey: widget.searchKey!);
      //       },
      //     ));
      //   else if (widget.lastPage == "appointment")
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return AppointmentScreen(
      //           finished: false,
      //         );
      //       },
      //     ));
      // }, widget.cart, widget.lastPage!, widget.searchKey!),
      body: getBody(size),
      bottomNavigationBar: getBottomNavbar(context),
    );
  }

  Widget getBody(Size size) {
    return GetBuilder<SpaController>(
      builder: (controller) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //==================================================IMAGE
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
                  Image.asset("assets/images/spa2.png", width: size.width * 1),
                  Image.asset("assets/images/spa3.png", width: size.width * 1),
                ],
              ),
            ),
            //===================================================DETAILS
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.spaDetail[0].spaName}",
                          // widget.spa!.spaName!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 20),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/icons/phone.png",
                                  width: size.width * 0.08,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/icons/love.png",
                                  width: size.width * 0.08,
                                  color: Colors.red,
                                )),
                          ],
                        )
                      ],
                    ),
                    Row(children: [
                      for (int i = 1; i <= 5; i++)
                        Image.asset(
                          StrConstants.iconPath + "starColor.png",
                          width: 25,
                        ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.spaDetail[0].address}",
                      style: TextStyle(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PickFuntionButton(
                          text: "Services",
                          selected: selected!,
                          func: () {
                            setState(() {
                              selected = "Services";
                            });
                          },
                          sizeButton: size.width * 0.25,
                        ),
                        PickFuntionButton(
                          text: "Reviews",
                          selected: selected!,
                          func: () {
                            setState(() {
                              selected = "Reviews";
                            });
                          },
                          sizeButton: size.width * 0.25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1, color: Colors.black54))),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    getListOfFunction(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Column getListOfFunction() {
    if (selected == "Reviews")
      return getListReviews();
    else if (selected == "Services")
      return getListService();
    else
      return Column();
  }

  Column getListReviews() {
    return Column(
      children: [
        ReviewBox(
            name: "Phạm Thùy Linh",
            cmt:
                "Excellent service quality, friendly, attentive staff, will come back again.",
            date: "22/09/2021",
            rate: 5),
        ReviewBox(
            name: "Tô Bích Loan",
            cmt:
                "Having booked an appointment but had to wait for 20 minutes, Minh's staff had a disrespectful attitude to customers, using the phone to make noise around.",
            date: "18/09/2021",
            rate: 2),
        ReviewBox(
            name: "Đào Thị Nở",
            cmt:
                "Diverse services, affordable prices, cool space, relaxing music for users",
            date: "05/08/2021",
            rate: 4),
        ReviewBox(
            name: "Nguyễn Tuyết Nhung",
            cmt:
                "Excellent service quality, friendly, attentive staff, will come back again.",
            date: "26/09/2021",
            rate: 5),
      ],
    );
  }

  Column getListService() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              //=====================MASSAGE
              if (selectedCate == "Massage")
                Container(
                    padding: EdgeInsets.only(
                      bottom:
                          2, // This can be the space you need betweeb text and underline
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black,
                      width: 3, // This would be the width of the underline
                    ))),
                    child: Text(
                      "Massage",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decorationThickness: 4,
                      ),
                    ))
              else
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCate = "Massage";
                      });
                    },
                    child: Text(
                      "Massage",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    )),
              SizedBox(
                width: 25,
              ),

              //=====================FACIAL
              if (selectedCate == "Facial")
                Container(
                    padding: EdgeInsets.only(
                      bottom:
                          2, // This can be the space you need betweeb text and underline
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black,
                      width: 3, // This would be the width of the underline
                    ))),
                    child: Text(
                      "Facial",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 4),
                    ))
              else
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCate = "Facial";
                      });
                    },
                    child: Text(
                      "Facial",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    )),
              SizedBox(
                width: 25,
              ),
              //=====================SAUNA
              if (selectedCate == "Sauna")
                Container(
                    padding: EdgeInsets.only(
                      bottom:
                          2, // This can be the space you need betweeb text and underline
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black,
                      width: 3, // This would be the width of the underline
                    ))),
                    child: Text(
                      "Sauna",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 4),
                    ))
              else
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCate = "Sauna";
                      });
                    },
                    child: Text(
                      "Sauna",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    )),
              SizedBox(
                width: 25,
              ),
              //=====================HOT STONE
              if (selectedCate == "Hot stone therapy")
                Container(
                    padding: EdgeInsets.only(
                      bottom:
                          2, // This can be the space you need betweeb text and underline
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black,
                      width: 3, // This would be the width of the underline
                    ))),
                    child: Text(
                      "Hot stone therapy",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 4),
                    ))
              else
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCate = "Hot stone therapy";
                      });
                    },
                    child: Text(
                      "Hot stone therapy",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    )),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        getServiceDetail()
      ],
    );
  }

  showMyAlertDialog(Service2? service) {
    String img = "";
    if (service != null) {
      TextEditingController _controller = TextEditingController();
      Size size = MediaQuery.of(context).size;
      double imgSize = size.width * 0.5;
      double sizePopup = (size.width * 0.3 / 4 * 3 + 30) + size.height * 0.12;
      double sizeTopBot = size.height * 0.2 / 2;
      if (service.cateType == "Massage")
        img = "massage.png";
      else if (service.cateType == "Facial")
        img = "facial1.png";
      else if (service.cateType == "Sauna")
        img = "sauna.png";
      else if (service.cateType == "Hot stone therapy")
        img = "hotStoneTherapy.png";
      Dialog dialog = Dialog(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'widget.spa!.name!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.spa!.address!,
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Service rate: ${widget.selectedService!.rate.toString()}",
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                        Image.asset(
                          StrConstants.iconPath + "starColor.png",
                          width: 18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (service.sale > 0)
                          Stack(
                            children: [
                              Image.asset(
                                StrConstants.imgPath + img,
                                width: size.width * 0.7,
                                height: size.width * 0.7 * 3 / 4,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                "Sale ${service.sale}%",
                                style: TextStyle(
                                    backgroundColor: Colors.red[100],
                                    color: Colors.red,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        else
                          Image.asset(
                            StrConstants.imgPath + img,
                            width: size.width * 0.7,
                            height: size.width * 0.7 * 3 / 4,
                            fit: BoxFit.fill,
                          )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name + " " + service.cateType,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.mainColorBold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Price: ",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(service.price)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          Text(
                            service.name +
                                " " +
                                service.cateType +
                                " is your beauty care service. Make you feel comfortable, relieve stress after work.",
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text("Cancel"),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context, service);
                                },
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text("Choose"),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );
      Future<dynamic> futureValue = showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return dialog;
        },
      ).then((value) {
        Service x = value as Service;
        if (x != null)
          setState(() {
            widget.cart.add(value);
          });
      });
    }
  }

  Column getServiceDetail() {
    if (selectedCate == "Massage") {
      List<Service> list = [];
      list.addAll(_spaController.spaDetail[0].services!);
      return Column(
        children: [
          for (int i = 0; i < list.length; i++)
            getServiceBox(list[i], "massage.png"),
        ],
      );
      // }
      // else if (selectedCate == "Facial") {
      //   List<Service> list = [];
      //   list.addAll(widget.spa.getByCate("Facial"));
      //   return Column(
      //     children: [
      //       for (int i = 0; i < list.length; i++)
      //         getServiceBox(list[i], "facial1.png"),
      //     ],
      //   );
      // } else if (selectedCate == "Sauna") {
      //   List<Service> list = [];
      //   list.addAll(widget.spa.getByCate("Sauna"));
      //   return Column(
      //     children: [
      //       for (int i = 0; i < list.length; i++)
      //         getServiceBox(list[i], "sauna.png"),
      //     ],
      //   );
      // } else if (selectedCate == "Hot stone therapy") {
      //   List<Service> list = [];
      //   list.addAll(widget.spa.getByCate("Hot stone therapy"));
      //   return Column(
      //     children: [
      //       for (int i = 0; i < list.length; i++)
      //         getServiceBox(list[i], "hotStoneTherapy.png"),
      //     ],
      //   );
    } else
      return Column();
  }

  Widget getBottomNavbar(BuildContext context) {
    if (widget.cart.isEmpty) {
      return GestureDetector(
        onTap: () {
          showNotify(context);
        },
        child: Container(
            height: 50,
            color: Colors.grey[500],
            child: Center(
              child: Text(
                "Place Appointment",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            )),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BookingAppointmentScreen1(cart: widget.cart, spa: _spaController.spaDetail);
            },
          ));
        },
        child: Container(
            height: 50,
            color: ColorConstants.mainColorBold,
            child: Center(
              child: Text(
                "Place Appointment",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
      );
    }
  }

  showNotify(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Please choose Service",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context, true);
          },
        )
      ],
    ));
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget getServiceBox(
    Service service,
    String image,
  ) {
    Size size = MediaQuery.of(context).size;

    String description = service.name!;
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        // onTap: func,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorConstants.mainColor),
                width: size.width * 0.85,
                height: size.width * 0.3 / 4 * 3 + 30,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        '${service.urlImage}',
                        width: size.width * 0.27,
                        height: size.width * 0.3 / 4 * 3,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.mainColorBold),
                            ),
                            Text(
                              "Time: ${service.duration} minute",
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            Text(
                              service.description!,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: size.width * 0.3 / 4 * 3 + 30 - 10),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    width: 2,
                                    color: ColorConstants.mainColorBold),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${NumberFormat.currency(locale: "vi-VN", symbol: "VND").format(service.price)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            getButtonChoose(service)
          ],
        ),
      ),
    );
  }

  Widget getButtonChoose(Service service) {
    bool inCart = false;
    Size size = MediaQuery.of(context).size;
    for (Service x in widget.cart) if (x == service) inCart = true;
    if (!inCart) {
      return Padding(
        padding: EdgeInsets.only(top: size.width * 0.3 / 4 * 3 + 30 - 10),
        child: Center(
            child: Container(
          child: RaisedButton(
            onPressed: () {
              setState(() {
                widget.cart.add(service);
              });
            },
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              "Choose",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          height: 25,
          width: 80,
        )),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: size.width * 0.3 / 4 * 3 + 30 - 10),
        child: Center(
            child: Container(
          child: RaisedButton(
            onPressed: () {
              setState(() {
                widget.cart.remove(service);
              });
            },
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              "Cancel",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          height: 25,
          width: 80,
        )),
      );
    }
  }
}
