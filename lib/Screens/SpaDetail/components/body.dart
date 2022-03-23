// import 'dart:async';
// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:spa_booking/Components/pick_function_button.dart';
// import 'package:spa_booking/Screens/SpaDetail/components/review_box.dart';
// import 'package:spa_booking/Screens/SpaDetail/components/service_detail.dart';
// import 'package:spa_booking/Screens/SpaDetail/components/services.dart';
// import 'package:spa_booking/models/service.dart';
// import 'package:spa_booking/models/spa.dart';
// import 'package:spa_booking/utils/constants.dart';
//
// class Body extends StatefulWidget {
//   String searchKey="";
//   String lastPage="";
//   Spa spa;
//   Service? selectedService=null;
//
//   Body({required this.lastPage, required this.searchKey, required this.spa, Service? service}){
//     if(service!=null)
//       selectedService=service;
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     return _Body();
//   }
// }
//
// class _Body extends State<Body> {
//   String selected = "Services";
//   String selectedCate = "Massage";
//   @override
//   void initState() {
//
//     super.initState();
//     Timer.run((){
//       if(widget.selectedService != null )
//         showMyAlertDialog(context, widget.selectedService);
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           //==================================================IMAGE
//           Container(
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 autoPlay: true,
//                 aspectRatio: 2.0,
//               ),
//               items: [
//                 Image.asset(
//                   "assets/images/spa4.png",
//                   width: size.width * 1,
//                 ),
//                 Image.asset("assets/images/spa2.png", width: size.width * 1),
//                 Image.asset("assets/images/spa3.png", width: size.width * 1),
//               ],
//             ),
//           ),
//           //===================================================DETAILS
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//               padding: EdgeInsets.only(left: 15, right: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         widget.spa.name,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic,
//                             fontSize: 20),
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: Image.asset(
//                                 "assets/icons/phone.png",
//                                 width: size.width * 0.08,
//                               )),
//                           IconButton(
//                               onPressed: () {},
//                               icon: Image.asset(
//                                 "assets/icons/love.png",
//                                 width: size.width * 0.08,
//                                 color: Colors.red,
//                               )),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(children: [
//                     for (int i = 1; i <= widget.spa.rate.round(); i++)
//                       Image.asset(
//                         StrConstants.iconPath + "starColor.png",
//                         width: 25,
//                       ),
//                     for (int i = 1; i <= 5 - widget.spa.rate.round(); i++)
//                       Image.asset(
//                         StrConstants.iconPath + "starNoColor.png",
//                         width: 25,
//                       ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 15),
//                       child: Text(
//                         "${widget.spa.totalRate} reviews",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     )
//                   ]),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     widget.spa.address,
//                     style: TextStyle(
//                         color: Colors.black54,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       PickFuntionButton(
//                         text: "Services",
//                         selected: selected,
//                         func: () {
//                           setState(() {
//                             selected = "Services";
//                           });
//                         },
//                         sizeButton: size.width * 0.25,
//                       ),
//                       PickFuntionButton(
//                         text: "Reviews",
//                         selected: selected,
//                         func: () {
//                           setState(() {
//                             selected = "Reviews";
//                           });
//                         },
//                         sizeButton: size.width * 0.25,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Center(
//                     child: Container(
//                       width: size.width * 0.8,
//                       decoration: BoxDecoration(
//                           border: Border(
//                               top:
//                                   BorderSide(width: 1, color: Colors.black54))),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   getListOfFunction(context),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
//
//   Column getListOfFunction(BuildContext context) {
//     if (selected == "Reviews")
//       return getListReviews();
//     else if (selected == "Services")
//       return getListService();
//     else
//       return Column();
//   }
//
//   Column getListReviews() {
//     return Column(
//       children: [
//         ReviewBox(
//             name: "Phạm Thùy Linh",
//             cmt:
//                 "Excellent service quality, friendly, attentive staff, will come back again.",
//             date: "22/09/2021",
//             rate: 5),
//         ReviewBox(
//             name: "Tô Bích Loan",
//             cmt:
//                 "Having booked an appointment but had to wait for 20 minutes, Minh's staff had a disrespectful attitude to customers, using the phone to make noise around.",
//             date: "18/09/2021",
//             rate: 2),
//         ReviewBox(
//             name: "Đào Thị Nở",
//             cmt:
//                 "Diverse services, affordable prices, cool space, relaxing music for users",
//             date: "05/08/2021",
//             rate: 4),
//         ReviewBox(
//             name: "Nguyễn Tuyết Nhung",
//             cmt:
//                 "Excellent service quality, friendly, attentive staff, will come back again.",
//             date: "26/09/2021",
//             rate: 5),
//       ],
//     );
//   }
//
//   Column getListService() {
//     return Column(
//       children: [
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               //=====================MASSAGE
//               if (selectedCate == "Massage")
//                 Container(
//                     padding: EdgeInsets.only(
//                       bottom:
//                       2, // This can be the space you need betweeb text and underline
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                               color: Colors.black,
//                               width: 3, // This would be the width of the underline
//                             ))),
//                     child: Text(
//                       "Massage",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         decorationThickness: 4,
//                       ),
//                     ))
//               else
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCate = "Massage";
//                       });
//                     },
//                     child: Text(
//                       "Massage",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[500]),
//                     )),
//               SizedBox(
//                 width: 25,
//               ),
//
//               //=====================FACIAL
//               if (selectedCate == "Facial")
//                 Container(
//                     padding: EdgeInsets.only(
//                       bottom:
//                       2, // This can be the space you need betweeb text and underline
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                               color: Colors.black,
//                               width: 3, // This would be the width of the underline
//                             ))),
//                     child: Text(
//                       "Facial",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           decorationThickness: 4),
//                     ))
//               else
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCate = "Facial";
//                       });
//                     },
//                     child: Text(
//                       "Facial",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[500]),
//                     )),
//               SizedBox(
//                 width: 25,
//               ),
//               //=====================SAUNA
//               if (selectedCate == "Sauna")
//                 Container(
//                     padding: EdgeInsets.only(
//                       bottom:
//                       2, // This can be the space you need betweeb text and underline
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                               color: Colors.black,
//                               width: 3, // This would be the width of the underline
//                             ))),
//                     child: Text(
//                       "Sauna",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           decorationThickness: 4),
//                     ))
//               else
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCate = "Sauna";
//                       });
//                     },
//                     child: Text(
//                       "Sauna",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[500]),
//                     )),
//               SizedBox(
//                 width: 25,
//               ),
//               //=====================HOT STONE
//               if (selectedCate == "Hot stone therapy")
//                 Container(
//                     padding: EdgeInsets.only(
//                       bottom:
//                       2, // This can be the space you need betweeb text and underline
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                               color: Colors.black,
//                               width: 3, // This would be the width of the underline
//                             ))),
//                     child: Text(
//                       "Hot stone therapy",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           decorationThickness: 4),
//                     ))
//               else
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCate = "Hot stone therapy";
//                       });
//                     },
//                     child: Text(
//                       "Hot stone therapy",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[500]),
//                     )),
//               SizedBox(
//                 width: 15,
//               ),
//             ],
//           ),
//         )
//         ,
//         SizedBox(
//           height: 15,
//         ),
//         getServiceDetail()
//       ],
//     );
//   }
//
//   showMyAlertDialog(BuildContext context, Service? service) {
//     String img="";
//     Size size=MediaQuery.of(context).size;
//     double sizePopup=(size.width * 0.3 / 4 * 3 + 30) + size.height*0.12;
//     double sizeTopBot=(size.height-sizePopup)/2;
//     if(service!.cateType == "Massage")
//       img="massage.png";
//     else if(service.cateType == "Facial")
//       img="facial1.png";
//     else if(service.cateType == "Sauna")
//       img="sauna.png";
//     else if(service.cateType == "Hot stone therapy")
//       img="hotStoneTherapy.png";
//     Dialog dialog = new Dialog(
//       insetPadding: EdgeInsets.only(left: 10, right: 10, top: sizeTopBot, bottom: sizeTopBot),
//
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(padding: EdgeInsets.only(top: 10, right: 10, left: 10),
//           child: Stack(
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.pop(context, true);
//                     },
//                     child: Image.asset(StrConstants.iconPath+"exit.png",width: 28,),
//                   )
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.end,
//               ),
//               Center(
//                 child: Text("Selected Service",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorConstants.textColorBold),),
//               )
//             ],
//           ),
//           ),
//           ServiceDetail(service: service, image: img , lastPage: widget.lastPage, searchKey: widget.searchKey, spa: widget.spa)
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );
//     Future<dynamic> futureValue = showGeneralDialog(
//       context: context,
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return dialog;
//       },
//     );
//   }
//
//   Column getServiceDetail() {
//     if (selectedCate == "Massage") {
//       List<Service> list = [];
//       list.addAll(widget.spa.getByCate("Massage"));
//       return Column(
//         children: [
//           for (int i = 0; i < list.length; i++)
//             ServiceDetail(service: list[i], image: "massage.png",lastPage: widget.lastPage,searchKey: widget.searchKey,spa: widget.spa,),
//         ],
//       );
//     } else if (selectedCate == "Facial") {
//       List<Service> list = [];
//       list.addAll(widget.spa.getByCate("Facial"));
//       return Column(
//         children: [
//           for (int i = 0; i < list.length; i++)
//             ServiceDetail(service: list[i], image: "facial1.png",lastPage: widget.lastPage,searchKey: widget.searchKey,spa: widget.spa),
//         ],
//       );
//     } else if (selectedCate == "Sauna") {
//       List<Service> list = [];
//       list.addAll(widget.spa.getByCate("Sauna"));
//       return Column(
//         children: [
//           for (int i = 0; i < list.length; i++)
//             ServiceDetail(service: list[i], image: "sauna.png",lastPage: widget.lastPage,searchKey: widget.searchKey,spa: widget.spa),
//         ],
//       );
//     } else if (selectedCate == "Hot stone therapy") {
//       List<Service> list = [];
//       list.addAll(widget.spa.getByCate("Hot stone therapy"));
//       return Column(
//         children: [
//           for (int i = 0; i < list.length; i++)
//             ServiceDetail(service: list[i], image: "hotStoneTherapy.png",lastPage: widget.lastPage,searchKey: widget.searchKey,spa: widget.spa),
//         ],
//       );
//     } else
//       return Column();
//   }
// }
